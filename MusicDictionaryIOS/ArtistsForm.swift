//
//  ArtistsForm.swift
//  MusicDictionaryIOS
//
//  Created by 林敏生 on 2020/09/23.
//  Copyright © 2020 林敏生. All rights reserved.
//

import Foundation

struct ArtistsFormResponse: Codable {
    let response: [ArtistsForm]
}
struct ArtistsForm: Codable {
    let name: String
    let gender: Int
    let voice: Int
    let length: Int
    let lyrics: Int
    let genre1: String?
    let genre2: String?
}

