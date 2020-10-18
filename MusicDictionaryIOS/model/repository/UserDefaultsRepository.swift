//
//  UserDefaultsRepository.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/24.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation

protocol UserDefaultsRepository: AnyObject {
    
    // ユーザー名取得
    func getName() -> String
    // Email取得
    func getEmail() -> String
    // 性別取得
    func getGender() -> Int
    // 地域取得
    func getArea() -> Int
    // 年齢取得
    func getBirthday() -> Int
    // アーティスト取得
    func getCount() -> Int
}

class UserDefaultsRepositoryImp : UserDefaultsRepository {
    
    func getName() -> String {
        return "user1"
    }
    
    func getEmail() -> String {
        return "test"
    }
    
    func getGender() -> Int {
        return 1
    }
    
    func getArea() -> Int {
        return 1
    }
    
    func getBirthday() -> Int {
        return 1
    }
    
    func getCount() -> Int {
        return 5
    }
    
}
