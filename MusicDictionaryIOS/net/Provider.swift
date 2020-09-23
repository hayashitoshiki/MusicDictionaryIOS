//
//  Provider.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation

import Moya
import RxSwift
import Alamofire

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

// ネットワーク設定
class Api {
    
    static let shared = Api()
    // リクエスト管理
    private var requestId: Int64 = 0
    // 通常のタイムアウト秒数
    private static let defaultTimeout: TimeInterval = 20

    
    // 通常の接続設定
    private var defaultProvider: MoyaProvider<MultiTarget> = {
        let plugins = createPlugin()
        let session = Api.createSession(timeout: Api.defaultTimeout)
        return MoyaProvider<MultiTarget>(session: session, plugins: plugins)
    }()

    // Session作成
    static func createSession(timeout: TimeInterval) -> Session {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = timeout
        return Alamofire.Session(configuration: configuration)
    }

    // プラグイン作成
    static func createPlugin() -> [PluginType] {
        let authPlugin = AccessTokenPlugin { authorizationType in
            switch authorizationType {
            case .bearer:
                return ""
            default:
                return ""
            }
        }

        let logging = NetworkLoggerPlugin()
        logging.configuration.logOptions = [.formatRequestAscURL]

       // let indicator = IndicatorView()
        let network = NetworkActivityPlugin{ change, target in
            print(target)
            if change == .began {
              //  indicator.show()
            } else if change == .ended {
               // indicator.hide()
            }
            
        }
        let cache = MoyaCacheablePlugin()
        return [authPlugin, logging, network, cache]
    }

    // API接続
    func request<R>(_ request: R) -> Single<R.Response> where R: Provider {
        requestId += 1
        let id = requestId
        let provider = defaultProvider
        let target = MultiTarget(request)
        
        return provider.rx.request(target)
            .filterSuccessfulStatusCodes()
            .map(R.Response.self)
            // エラー処理
           .retryWhen{ (errors: Observable<Error>) in
                errors.enumerated().flatMap{ retryCount, err -> Observable<Void> in
                    Observable.create { observer in
                        // 想定内エラーはチェック
                        let flag: Bool = ErrorUseCase.shared.handlMoyaError(moyaError: err, requestId: id, retryCount: retryCount, observer: observer)

                        if !flag {
                            ErrorUseCase.shared.hideErrorSureen(requestId: id)
                            observer.onError(err)
                        }

                        return Disposables.create()
                    }
                }
            }
            // 成功処理
            .do(onSuccess: { _ in
                ErrorUseCase.shared.hideErrorSureen(requestId: id)
            })
    }
}


// Protocol設定
struct Response<T: Codable> : Codable {
    let response: T
}

// ローカルサーバー
protocol Provider: TargetType {
    associatedtype Response: Codable
}
extension Provider {
    var baseURL: URL { return URL(string: PropertyUtil.shared.prop.baseUrl)! }
    var headers: [String : String]? { return nil }
    var sampleData: Data {
        let path = Bundle.main.path(forResource: "samples", ofType: "json")!
        return FileHandle(forReadingAtPath: path)!.readDataToEndOfFile()
    }
}


enum ApiService{}
