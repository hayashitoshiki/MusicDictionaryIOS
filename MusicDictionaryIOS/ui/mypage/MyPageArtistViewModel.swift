//
//  MyPageArtistViewModel.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import RxCocoa
import RxSwift
import Alamofire

class MyPageArtistViewModel {
    
    private let disposeBag = DisposeBag()
    let state = PublishRelay<Status>()
    let artistList = BehaviorRelay<[ArtistsForm]>(value: [])
    
    private let apiServiceRepository = ApiServiceRepositoryImp()
    private let userDefaultsRepository = UserDefaultsRepositoryImp()
                   
            
    // アーティスト取得
    func getArtists() {
        state.accept(.Loding)
        
        apiServiceRepository.getArtist()
            .subscribe(
                onSuccess: { [unowned self] data in
                    print("success")
                    self.artistList.accept(data.response)
                    self.state.accept(.Success)
                },
                onError: { [unowned self] error in
                    print("error")
                    self.artistList.accept([])
                    self.state.accept(.Failure)
            })
            .disposed(by: disposeBag)
    }
}
