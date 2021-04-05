//
//  DetailTableViewCellViewModel.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 23.03.2021.
//

import Foundation

class DetailTableViewCellViewModel: DetailTableViewCellViewModelType {
    var translation: String
    
    init(translation: String) {
        self.translation = translation
    }
}
