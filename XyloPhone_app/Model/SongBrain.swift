//
//  SongBrain.swift
//  XyloPhone_app
//
//  Created by AYTAÇ BULANIK on 14.03.2022.
//

import UIKit
import AVFoundation

struct SongBrain {
    var songName : String?
    var player : AVAudioPlayer!
    mutating func songPlay(name : String) {
        let url = Bundle.main.url(forResource: name, withExtension: "wav")!
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            self.player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
        } catch {
            print(error.localizedDescription)
        }
        player.play()
    }
}
