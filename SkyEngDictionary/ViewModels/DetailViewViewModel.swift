//
//  DetailViewViewModel.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 23.03.2021.
//

import Foundation

class DetailViewViewModel: DetailViewViewModelType {
    var meanings: [Meaning]
    var meaning: Meaning
    var word: String
    var selectedIndexPath: IndexPath?
    
    init(meanings: [Meaning], meaning: Meaning, word: String) {
        self.meanings = meanings
        self.meaning = meaning
        self.word = word
    }
    
    var translation: String {
        return meaning.translation.text
    }
    
    var transcription: String {
        return meaning.transcription
    }
    
    var imageUrlString: String {
        return "https:" + meaning.imageUrl
    }
    
    var soundUrlString: String {
        return "https:" + meaning.soundUrl
    }
    
    func numberOfRows() -> Int {
        return meanings.count
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.meaning = meanings[indexPath.row]
    }
    
    func cellViewModel(for indexPath: IndexPath) -> DetailTableViewCellViewModelType? {
        return DetailTableViewCellViewModel(translation: meanings[indexPath.row].translation.text)
    }
}
