//
//  MyPageArtistViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MyPageArtistViewController: UIViewController {

    private let viewModel = MyPageArtistViewModel()
    private let disposeBag = DisposeBag()
        
    @IBOutlet weak var artistTableView: UITableView!
        
    private let dataSource = MyPageArtistTableViewDataSource()
    
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // ナビゲーションを透明にする処理
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bing()
        viewModel.getArtists()
    }
        
    func bing() {
        disposeBag.insert(
            viewModel.state
                .subscribe(onNext: { [unowned self] value in self.onStateChanged(state: value) }),
            
            viewModel.artistList
                .bind(to: artistTableView.rx.items(dataSource: dataSource))
        )
    }
        
    func onStateChanged(state: Status) {
        switch state {
        case .Loding: break
        case .Success: break
        case .Failure: break
        }
    }

}
