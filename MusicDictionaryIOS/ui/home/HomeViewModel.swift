//
//  HomeViewModel.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

class HomeViewModel {
    
    private let disposeBag = DisposeBag()
    private let userDefaultsRepository = UserDefaultsRepositoryImp()
    
    let isCategoryButtonEnabled = BehaviorRelay<Bool>(value: true)
    let isDetailButtonEnabled = BehaviorRelay<Bool>(value: true)
    let isSoaringButtonEnabled = BehaviorRelay<Bool>(value: true)
    let isRecommendButtonEnabled = BehaviorRelay<Bool>(value: true)
    
    init() {
        // ボタンの活性・非活性初期化
        let count = userDefaultsRepository.getCount()
        
        if count == 0 {
            
        }
        if count < 3 {
            isCategoryButtonEnabled.accept(false)
        }
        if count < 5 {
            isDetailButtonEnabled.accept(false)
        }
        if count < 7 {
            isSoaringButtonEnabled.accept(false)
        }
        if count < 10 {
            isRecommendButtonEnabled.accept(false)
        }
        
    }
}

