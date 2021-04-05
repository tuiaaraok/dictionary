//
//  ImageDataStore.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 22.03.2021.
//

import Foundation

class DataStore {
    
    func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
    }
    
    func getCachedImage(url: URL) -> Data? {
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            return cacheResponse.data
        }
        return nil
    }
}
