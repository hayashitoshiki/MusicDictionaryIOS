//
//  MyPageUserViewModel.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class MyPageUserViewModel {
    
    private let userDefaultsRepository = UserDefaultsRepositoryImp()
    
    let userName = BehaviorRelay<String>(value: "")
    let userEmail = BehaviorRelay<String>(value: "")
    let userGender = BehaviorRelay<String>(value: "")
    let userArea = BehaviorRelay<String>(value: "")
    let userBirthday = BehaviorRelay<String>(value: "")
    let userCount = BehaviorRelay<String>(value: "")
    
    init() {
        userName.accept(userDefaultsRepository.getName())
        userEmail.accept(userDefaultsRepository.getEmail())
        userGender.accept(UserInfoChangeListUtil().changeGender(code: userDefaultsRepository.getGender()))
        userArea.accept(UserInfoChangeListUtil().changeArea(code: userDefaultsRepository.getArea()))
        userBirthday.accept(UserInfoChangeListUtil().getBirthday(code: userDefaultsRepository.getBirthday()))
        userCount.accept(String(userDefaultsRepository.getCount()))
    }
}
