//
//  ViewModel.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    var results: [Result]?
    var selectedIndexPath: IndexPath?
    
    func searchWord(_ searchText: String) {
        DataFetcherService.shared.fetchResults(searchText: searchText) {  [weak self] (results) in
            self?.results = results
        }
    }
    
    func numberOfSection() -> Int {
        return results?.count ?? 0
    }
    
    func numberOfRows(in section: Int) -> Int {
        return results?[section].meanings.count ?? 0
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let results = results else { return nil }
        let result = results[indexPath.section]
        let meaning = result.meanings[indexPath.row]
        return TableViewCellViewModel(meaning: meaning)
    }
    
    func detailVCViewModel(forIndexPath indexPath: IndexPath, word: String) -> DetailViewViewModelType? {
        guard let results = results else { return nil }
        let result = results[indexPath.section]
        let meaning = result.meanings[indexPath.row]
        var meanings2 = [Meaning]()
        for i in results {
            for io in i.meanings {
                meanings2.append(io)
            }
        }
//        return DetailViewViewModel(meanings: meanings2, meaning: meaning, word: result.text)
        return DetailViewViewModel(meanings: result.meanings, meaning: meaning, word: result.text)
    }
}
