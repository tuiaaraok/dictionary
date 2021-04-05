//
//  DetailViewController.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 23.03.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak private var viewBg1: UIView!
    @IBOutlet weak private var mainImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak private var translationLabel: UILabel!
    @IBOutlet weak var transcriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var otherTranslationsLabel: UILabel!
    var viewModel: DetailViewViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureScreen()
        getAndPlaySound()
    }
    
    private func configureScreen() {
        getImage()
        tableView.rowHeight = 90
        guard let viewModel = viewModel else { return }
        wordLabel.text = viewModel.meaning.translation.text
        translationLabel.text = viewModel.word
        transcriptionLabel.text = viewModel.meaning.transcription
        
        mainImage.layer.cornerRadius = 20
        viewBg1.layer.cornerRadius = 20
    }
    
    private func getImage() {
        guard let urlString = viewModel?.imageUrlString else { return }
        DataFetcherService.shared.fetchImage(urlString: urlString) { (data) in
             DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: data)
//                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func getAndPlaySound() {
        guard let urlString = viewModel?.soundUrlString else { return }
        DataFetcherService.shared.fetchSound(urlString: urlString)
    }
    
    @IBAction func playSound(_ sender: Any) {
        getAndPlaySound()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel?.numberOfRows() == 1 {
            tableView.isHidden = true
            otherTranslationsLabel.isHidden = true
        }
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? DetailTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(for: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.selectRow(atIndexPath: indexPath)
        viewDidLoad()
    }
}
