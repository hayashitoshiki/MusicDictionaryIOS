//
//  ResultTableViewCell.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/26.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var lyricRatingBar: CosmosView!
    @IBOutlet weak var voiceRatingBar: CosmosView!
    @IBOutlet weak var lengthRatingBar: CosmosView!
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    var gender: Int = 0 {
        didSet {
            switch gender {
            case 1:
                genderLabel.text = "男"
                genderLabel.textColor = UIColor.blue
            case 2:
                genderLabel.text = "女"
                genderLabel.textColor = UIColor.red
            default:
               genderLabel.text = "性別"
            }
        }
    }
    var lyrics: Int = 0 {
        didSet {
            lyricRatingBar.settings.totalStars = lyrics
        }
    }
    var voice: Int = 0 {
           didSet {
               voiceRatingBar.settings.totalStars = voice
           }
       }
    var length: Int = 0 {
        didSet {
            lengthRatingBar.settings.totalStars = voice
        }
    }
}
