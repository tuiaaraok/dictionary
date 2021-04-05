//
//  ViewController.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: TableViewViewModelType?
    var isSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        viewModel = ViewModel()
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: "reload"), object: nil)
        configureUI()
    }
    
    @objc func reload() {
        tableView.reloadData()
    }
    
    private func configureUI() {
        tableView.rowHeight = 132
        searchBar.becomeFirstResponder()
        searchBar.layer.cornerRadius = searchBar.bounds.width / 2
        
        let logo = UIImage(named: "skyeng.png")
        let imageView = UIImageView(image:logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
    }
    
    
    // MARK: - Navigation
       
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detail" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else {return}
        guard let word = searchBar.text else { return }
        let detailTableVC = segue.destination as! DetailViewController
        detailTableVC.viewModel = viewModel?.detailVCViewModel(forIndexPath: indexPath, word: word)
    }
}


// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
}
