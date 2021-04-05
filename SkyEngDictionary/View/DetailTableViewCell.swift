//
//  DetailTableViewCell.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 23.03.2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var view1: UIView!
    var viewModel: DetailTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            wordLabel.text = viewModel.translation
            view1.layer.cornerRadius = 15
        }
    }
}
