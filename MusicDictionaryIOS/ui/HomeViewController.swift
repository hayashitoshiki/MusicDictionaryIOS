//
//  HomeViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var soaringButton: UIButton!
    @IBOutlet weak var recommendButton: UIButton!
    
    @IBOutlet weak var searchErrorView: UIView!
    @IBOutlet weak var categoryErrorView: UIView!
    @IBOutlet weak var detailsErrorView: UIView!
    @IBOutlet weak var soaringErrorView: UIView!
    @IBOutlet weak var recommendErrorView: UIView!
    
    
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        searchBar.backgroundImage = UIImage()
        searchBar.textField!.backgroundColor = UIColor.gray_300
        bing()
    }
    
    // 非同期処理初期化
    private func bing() {
        disposeBag.insert(
            // ボタンバリデート
            viewModel.isCategoryButtonEnabled
            .subscribe(onNext: { [unowned self] value in
                self.searchErrorView.isHidden = value }),

            viewModel.isCategoryButtonEnabled
                .subscribe(onNext: { [unowned self] value in
                    self.categoryButton.isEnabled = value
                    self.categoryErrorView.isHidden = value }),
            
            viewModel.isDetailButtonEnabled
                .subscribe(onNext: { [unowned self] value in
                    self.detailButton.isEnabled = value
                    self.detailsErrorView.isHidden = value }),
                
            viewModel.isSoaringButtonEnabled
                .subscribe(onNext: { [unowned self] value in
                    self.soaringButton.isEnabled = value
                    self.soaringErrorView.isHidden = value }),
            
            viewModel.isRecommendButtonEnabled
                .subscribe(onNext: { [unowned self] value in
                    self.recommendButton.isEnabled = value
                    self.recommendErrorView.isHidden = value })
        )
    }


}

