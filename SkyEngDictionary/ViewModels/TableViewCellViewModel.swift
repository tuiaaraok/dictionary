//
//  TableViewCellViewModel.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation
class TableViewCellViewModel: TableViewCellViewModelType {
    
    var meaning: Meaning
    
    init(meaning: Meaning) {
        self.meaning = meaning
    }

    var translation: Translation {
        return meaning.translation
    }
    var previewUrl: String {
        return  "https:" + meaning.previewUrl
    }
    var imageUrl: String {
        return meaning.imageUrl
    }
    var transcription: String {
        return meaning.transcription
    }
    var soundUrl: String {
        return meaning.soundUrl
    }
}
