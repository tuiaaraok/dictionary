//
//  DetailViewViewModelType.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 23.03.2021.
//

import Foundation

protocol DetailViewViewModelType {
    var word: String { get }
    var meaning: Meaning { get set }
    var translation: String { get }
    var transcription: String { get }
    var imageUrlString: String { get }
    var soundUrlString: String { get }
    
    func numberOfRows() -> Int
    func selectRow(atIndexPath indexPath: IndexPath)
    func cellViewModel(for indexPath: IndexPath) -> DetailTableViewCellViewModelType?
//    func detailVCViewModel(forIndexPath indexPath: IndexPath, word: String) -> DetailViewViewModelType?
}
