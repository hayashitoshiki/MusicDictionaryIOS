//
//  MyPageArtistTableViewCell.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import UIKit
import Cosmos

class MyPageArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name: String? {
           didSet {
               nameLabel.text = name
           }
       }

}
