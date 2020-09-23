//
//  MoyaCacheablePlugin.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Moya

// キャッシュ管理

protocol  MoyaCacheable {
    typealias MoyaCacheablePolicy = URLRequest.CachePolicy
    var cachePolicy: MoyaCacheablePolicy? { get }
}

extension MultiTarget: MoyaCacheable {
    var cachePolicy: MoyaCacheablePolicy? {
        guard let cacheTarget = target as? MoyaCacheable else { return nil }
        return cacheTarget.cachePolicy
    }
}

final class MoyaCacheablePlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let moyaCacheableProtocol = target as? MoyaCacheable,
            let policy = moyaCacheableProtocol.cachePolicy {
            var cacheableRequest = request
            cacheableRequest.cachePolicy = policy
            return cacheableRequest
        }
        return request
    }
}
