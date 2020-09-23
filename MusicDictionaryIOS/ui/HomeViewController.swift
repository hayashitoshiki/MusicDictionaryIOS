//
//  HomeViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getArtists()
    }
    
    // 非同期処理初期化
    private func bing() {
//        var disposelist = [:]
//
//        disposelist.append()
//        disposeBag.insert(disposelist)
    }


}

