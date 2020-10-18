//
//  UserInfoChangeListUtil.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/10/18.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation

class UserInfoChangeListUtil {
    func changeGender(code: Int) -> String {
        switch code {
        case 1:
            return "男"
        case 2:
            return "女"
        default:
            return "未選択"
        }
    }
    
    
    func changeArea(code: Int) -> String {
        switch code {
        case 1:
            return "東京"
        case 2:
            return "神奈川"
        case 3:
            return "千葉"
        case 4:
            return "静岡"
        default:
            return "未選択"
        }
    }

    func getBirthday(code: Int) -> String {
        switch code {
        case 1:
            return "1996"
        case 2:
            return "1997"
        case 3:
            return "1998"
        case 4:
            return  "1999"
        case 5:
            return "2000"
        default:
            return ""
        }
    }
    
    func changeBirthdayString(code: String) -> Int {
        switch code {
        case "1996":
            return 1
        case "1997":
            return 2
        case "1998" :
            return 3
        case "1999" :
            return 4
        case "2000":
            return  5
        default:
            return 0
        }
    }
}
