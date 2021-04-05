//
//  DataFetcherService.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    var imageDataFetcher: ImageDataFetcher
    var soundDataFetcher: SoundDataFetcher
    static var shared = DataFetcherService()
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher(), imageDataFetcher: ImageDataFetcher = ImageDataFetcher(), soundDataFetcher: SoundDataFetcher = SoundDataFetcher()) {
        self.dataFetcher = dataFetcher
        self.imageDataFetcher = imageDataFetcher
        self.soundDataFetcher = soundDataFetcher
    }
    
    func fetchResults(searchText: String, completion: @escaping ([Result]?) -> Void) {
        let urlString = "https://dictionary.skyeng.ru/api/public/v1/words/search?search=\(searchText)&page=1&pageSize=25"
        
        dataFetcher.fetchGenericJSONData(urlString: urlString, reloadName: "reload", response: completion)
    }
    
    func fetchImage(urlString: String, completion: @escaping (Data) -> Void) {
        imageDataFetcher.fetchImage(imageString: urlString, completion: completion)
    }
    
    func fetchSound(urlString: String) {
        soundDataFetcher.fetchSound(urlString: urlString)
    }
}
