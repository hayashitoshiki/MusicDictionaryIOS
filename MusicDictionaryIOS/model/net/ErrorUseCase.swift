//
//  ErrorUseCase.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Moya
import RxCocoa
import RxSwift

// エラー処理

class ErrorUseCase {
    
    static let shared = ErrorUseCase()
    
    // 各リクエストごとにリトライ処理を管理する
    private var retryHanderDictionary: [String: RetryHandler] = [:]
    // リトライ処理の結果処理を管理する
    private var retryResultHandlerDictionary: [String: RetryResultHandler] = [:]
    
    
    // 想定内エラーチェック(エラー = true)
    func handlMoyaError(moyaError: Error, requestId: Int64, retryCount: Int, observer: AnyObserver<Void>)-> Bool {
        
        guard let error = moyaError as? MoyaError else { return false }
        
        createRetryHandler(requestId: requestId, retryCount: retryCount, observer: observer)
        
        switch error {
        case .underlying(let nsError, _):
            let urlError = nsError.asAFError?.underlyingError as? URLError
            switch urlError?.code {
            case URLError.notConnectedToInternet:
                return true
                
            case URLError.timedOut, URLError.cannotConnectToHost:
                return true
                
            default:
                return false
            }
            
        case .statusCode(let response):
            if response.statusCode == 504 {
                return true
            } else {
                return false
            }
            
        default:
            return false
        }
    }
    
    // Handler生成
    private func createRetryHandler(requestId: Int64, retryCount: Int, observer: AnyObserver<Void>) {
        var retryHandler: RetryHandler?
        let key = String(requestId)
        
        if retryCount == 0 {
            retryHandler = { [weak self] resultHandler in
                self?.retryResultHandlerDictionary[key] = resultHandler
                observer.onNext(())
            }
            retryHanderDictionary[key] = retryHandler
        } else {
            retryResultHandlerDictionary[key]?(false)
        }
    }
    
    
    func hideErrorSureen(requestId: Int64) {
        let key = String(requestId)
        retryResultHandlerDictionary[key]?(true)
        retryHanderDictionary[key] = nil
    }
}


typealias RetryHandler = (@escaping RetryResultHandler) -> Void
typealias RetryResultHandler = (Bool) -> Void
protocol NetworkErrorRetryDelegate: AnyObject {
    func setRetryHandler(handler: @escaping RetryHandler)
}
