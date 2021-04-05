//
//  TableViewCell.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak private var mainImage: UIImageView!
    @IBOutlet weak private var wordLabel: UILabel!
    @IBOutlet weak private var activityIndicator: UIActivityIndicatorView!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
            wordLabel.text = viewModel.translation.text
            mainImage.layer.cornerRadius = 15
    
            let imageUrl = viewModel.previewUrl
            DataFetcherService.shared.fetchImage(urlString: imageUrl) { (data) in
                 DispatchQueue.main.async {
                    self.mainImage.image = UIImage(data: data)
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}
