//
//  MyPageTopViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation

import UIKit
import RxSwift
import RxCocoa

class MyPageTopViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
       
    }
    
    
}
