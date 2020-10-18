//
//  PropertyUtil.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Rswift


class PropertyUtil {
    static let shared = PropertyUtil()

    let prop: AppProp!

    private init() {
        if let url = R.file.appPlist.path() {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: url))
                self.prop = try PropertyListDecoder().decode(AppProp.self, from: data)
            } catch {
                print("Failed to getting properties from plist .")
                print("Reason: \(error)")
                prop = nil
            }
        } else {
            prop = nil
        }
    }


}

struct  AppProp: Codable {
    let baseUrl: String
}
