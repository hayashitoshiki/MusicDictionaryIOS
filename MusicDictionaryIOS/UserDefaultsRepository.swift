//
//  UserDefaultsRepository.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/24.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
protocol UserDefaultsRepository: AnyObject {
    // アーティスト取得
    func getCount() -> Int
}

class UserDefaultsRepositoryImp : UserDefaultsRepository {
    
    func getCount() -> Int {
        return 5
    }
    
}
