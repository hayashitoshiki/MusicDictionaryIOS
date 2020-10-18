//
//  UISearchBar+Extension.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/25.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    var textField: UITextField? {
        if #available(iOS 13.0, *) {
            return searchTextField
        } else {
            return value(forKey: "_searchField") as? UITextField
        }
    }
}
