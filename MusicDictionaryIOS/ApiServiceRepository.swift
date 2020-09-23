//
//  ApiServiceRepository.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import RxSwift


protocol ApiServiceRepository: AnyObject {
    // アーティスト取得
    func getArtist() -> Single<ArtistsFormResponse>
}

class ApiServiceRepositoryImp: ApiServiceRepository {
    
    func getArtist() -> Single<ArtistsFormResponse> {
        return Api.shared.request(ApiService.GetArtistList())
    }
}
