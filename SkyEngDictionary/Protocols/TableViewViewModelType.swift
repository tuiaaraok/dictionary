//
//  TableViewViwModelType.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation
protocol TableViewViewModelType {
    
    func numberOfSection() -> Int
    func numberOfRows(in section: Int) -> Int
    func selectRow(atIndexPath indexPath: IndexPath)
    func cellViewModel(for indexPath: IndexPath) -> TableViewCellViewModelType?
    func searchWord(_ searchText: String)
    func detailVCViewModel(forIndexPath indexPath: IndexPath, word: String) -> DetailViewViewModelType? 
}
