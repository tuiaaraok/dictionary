//
//  TableViewCellViewModelType.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation
protocol TableViewCellViewModelType: class {
    var translation: Translation { get }
    var previewUrl: String { get }
    var imageUrl: String { get }
    var transcription: String { get }
    var soundUrl: String  { get }
}
