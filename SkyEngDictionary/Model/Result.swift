//
//  Result.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation

struct Result: Decodable {
    let text: String
    let meanings: [Meaning]
}

struct Meaning: Decodable {
    let translation: Translation
    let previewUrl: String
    let imageUrl: String
    let transcription: String
    let soundUrl: String
}

struct Translation: Decodable {
    let text: String
}
