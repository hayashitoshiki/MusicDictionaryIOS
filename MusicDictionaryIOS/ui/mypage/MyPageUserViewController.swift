//
//  MyPageUserViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MyPageUserViewController: UIViewController {

    private let viewModel = MyPageUserViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var emailValueLabel: UILabel!
    @IBOutlet weak var nameValueLabel: UILabel!
    @IBOutlet weak var dengerValueLabel: UILabel!
    @IBOutlet weak var areaValueLabel: UILabel!
    @IBOutlet weak var birtdayValueLabel: UILabel!
    @IBOutlet weak var artistCountValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bing()
    }
    
    func bing() {
        disposeBag.insert(
            viewModel.userName.bind(to: nameValueLabel.rx.text),
            viewModel.userEmail.bind(to: emailValueLabel.rx.text),
            viewModel.userGender.bind(to: dengerValueLabel.rx.text),
            viewModel.userArea.bind(to: areaValueLabel.rx.text),
            viewModel.userBirthday.bind(to: birtdayValueLabel.rx.text),
            viewModel.userCount.bind(to: artistCountValueLabel.rx.text)
        )
    }
    
}
