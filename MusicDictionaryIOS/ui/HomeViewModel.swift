//
//  HomeViewModel.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class HomeViewModel {
    
    let disposeBag = DisposeBag()
    private let apiServiceRepository = ApiServiceRepositoryImp()
    
    func getArtists() {
        apiServiceRepository.getArtist()
        .subscribe(
            onSuccess: { [unowned self] data in
                print("success")
                print(data)

        },
            onError: { [unowned self] error in
                print("error")
                print(error)

        })
        .disposed(by: disposeBag)
    }
}

