//
//  SearchBarSettings.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import UIKit

extension ViewController: UISearchBarDelegate{
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
       {

        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        guard let viewModel = viewModel else { return }
        viewModel.searchWord(searchBar.text!)
        activityIndicator.stopAnimating()
        searchBar.endEditing(true)
       }

    func searchBarCancelButtonClicked(_ searchController: UISearchBar) {
        isSearch = false
        searchBar.text = ""
        tableView.reloadData()
        view.endEditing(true)
    }
}
