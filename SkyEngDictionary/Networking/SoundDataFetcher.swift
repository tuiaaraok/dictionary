//
//  SoundDataFetcher.swift
//  SkyEngDictionary
//
//  Created by Туйаара Оконешникова on 24.03.2021.
//

import Foundation
import AVFoundation

class SoundDataFetcher {
    
    var player : AVPlayer?
    func fetchSound(urlString: String) {
          guard  let url = URL(string: urlString)
         else {
            print("error to get the mp3 file")
            return
        }
         do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = AVPlayer(url: url as URL)
            guard let player = player else { return }
            player.play()
         } catch let error {
            print(error.localizedDescription)
        }
    }
}
