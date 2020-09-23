//
//  ApiService.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Moya

extension ApiService {
    
    // アーティスト取得
    struct GetArtistList: Provider {
        
        typealias Response = ArtistsFormResponse
        
        var method: Moya.Method { return .get }
        var path: String { return "/artist/find/soaring.json" }
        var task: Task { return .requestPlain }
        
        init() {}
    }
}
