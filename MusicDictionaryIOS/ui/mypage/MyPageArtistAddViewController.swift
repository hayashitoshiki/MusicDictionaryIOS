//
//  MyPageArtistAddViewController.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/19.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import DLRadioButton

class MyPageArtistAddViewController: UIViewController {

    //private let viewModel = MyPageArtistAddViewModel()
    private let disposeBag = DisposeBag()
        

    @IBOutlet weak var genderRadio1: DLRadioButton!
    @IBOutlet weak var genderRadio2: DLRadioButton!
    
    @IBOutlet weak var lengthRadio1: DLRadioButton!
    @IBOutlet weak var lengthRadio2: DLRadioButton!
    @IBOutlet weak var lengthRadio3: DLRadioButton!
    @IBOutlet weak var lengthRadio4: DLRadioButton!
    @IBOutlet weak var lengthRadio5: DLRadioButton!
    
    @IBOutlet weak var voiceRadio1: DLRadioButton!
    @IBOutlet weak var voiceRadio2: DLRadioButton!
    @IBOutlet weak var voiceRadio3: DLRadioButton!
    @IBOutlet weak var voiceRadio4: DLRadioButton!
    @IBOutlet weak var voiceRadio5: DLRadioButton!
    
    @IBOutlet weak var lyricRadio1: DLRadioButton!
    @IBOutlet weak var lyricRadio2: DLRadioButton!
    @IBOutlet weak var lyricRadio3: DLRadioButton!
    @IBOutlet weak var lyricRadio4: DLRadioButton!
    @IBOutlet weak var lyricRadio5: DLRadioButton!
    
    var genderRadioList: [DLRadioButton] = []
    var lengthRadioList: [DLRadioButton] = []
    var voiceRadioList: [DLRadioButton] = []
    var lyricRadioList: [DLRadioButton] = []
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        genderRadioList.append(genderRadio1)
        genderRadioList.append(genderRadio2)
        lengthRadioList.append(lengthRadio1)
        lengthRadioList.append(lengthRadio2)
        lengthRadioList.append(lengthRadio3)
        lengthRadioList.append(lengthRadio4)
        lengthRadioList.append(lengthRadio5)
        voiceRadioList.append(voiceRadio1)
        voiceRadioList.append(voiceRadio2)
        voiceRadioList.append(voiceRadio3)
        voiceRadioList.append(voiceRadio4)
        voiceRadioList.append(voiceRadio5)
        lyricRadioList.append(lyricRadio1)
        lyricRadioList.append(lyricRadio2)
        lyricRadioList.append(lyricRadio3)
        lyricRadioList.append(lyricRadio4)
        lyricRadioList.append(lyricRadio5)

        // ナビゲーションを透明にする処理
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        bing()
    }
        
    func bing() {
         disposeBag.insert(
            genderRadio1.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.genderRadioCheck(button: self!.genderRadio1)
            }),
            genderRadio2.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.genderRadioCheck(button: self!.genderRadio2)
            }),
            lengthRadio1.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lengthRadioCheck(button: self!.lengthRadio1)
            }),
            lengthRadio2.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lengthRadioCheck(button: self!.lengthRadio2)
            }),
            lengthRadio3.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lengthRadioCheck(button: self!.lengthRadio3)
            }),
            lengthRadio4.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lengthRadioCheck(button: self!.lengthRadio4)
            }),
            lengthRadio5.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lengthRadioCheck(button: self!.lengthRadio5)
            }),
            voiceRadio1.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.voiceRadioCheck(button: self!.voiceRadio1)
            }),
            voiceRadio2.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.voiceRadioCheck(button: self!.voiceRadio2)
            }),
            voiceRadio3.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.voiceRadioCheck(button: self!.voiceRadio3)
            }),
            voiceRadio4.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.voiceRadioCheck(button: self!.voiceRadio4)
            }),
            voiceRadio5.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.voiceRadioCheck(button: self!.voiceRadio5)
            }),
            lyricRadio1.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lyricRadioCheck(button: self!.lyricRadio1)
            }),
            lyricRadio2.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lyricRadioCheck(button: self!.lyricRadio2)
            }),
            lyricRadio3.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lyricRadioCheck(button: self!.lyricRadio3)
            }),
            lyricRadio4.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lyricRadioCheck(button: self!.lyricRadio4)
            }),
            lyricRadio5.rx.tap.subscribe(onNext: { [weak self] _ in
                self?.lyricRadioCheck(button: self!.lyricRadio5)
            })
        )
    }
    
    
    // 性別ラジオボタン制御
    func genderRadioCheck(button: DLRadioButton) {
        for radioButton in genderRadioList {
            if radioButton != button {
                radioButton.isSelected = false
            }
        }
    }
    
    // 高さラジオボタン制御
    func voiceRadioCheck(button: DLRadioButton) {
        for radioButton in voiceRadioList {
            if radioButton != button {
                radioButton.isSelected = false
            }
        }
    }
    
    // 長さラジオボタン制御
    func lengthRadioCheck(button: DLRadioButton) {
        for radioButton in lengthRadioList {
            if radioButton != button {
                radioButton.isSelected = false
            }
        }
    }
    
    // 歌詞ラジオボタン制御
    func lyricRadioCheck(button: DLRadioButton) {
        for radioButton in lyricRadioList {
            if radioButton != button {
                radioButton.isSelected = false
            }
        }
    }
    
}
