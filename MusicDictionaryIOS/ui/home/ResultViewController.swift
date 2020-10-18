//
//  ResultViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/25.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ResultViewController: UIViewController {

    private let viewModel = ResultViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var resultTableViewHeight: NSLayoutConstraint!
    
    private let dataSource = RessultTableViewDataSource()
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
       // resultTableViewHeight.constant = CGFloat(resultTableView.contentSize.height)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // ナビゲーションを透明にする処理
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
//         self.navigationController!.navigationBar.barTintColor = UIColor.yellow
//        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController!.navigationBar.shadowImage = UIImage()
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
                .bind(to: resultTableView.rx.items(dataSource: dataSource))
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
