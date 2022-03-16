//
//  ViewController.swift
//  XyloPhone_app
//
//  Created by AYTAÇ BULANIK on 14.03.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var songBrain = SongBrain()
    var player : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let buttonName = sender.currentTitle {
            songBrain.songPlay(name: buttonName)
            sender.alpha = 0.5
            songBrain.buttonColorChanged(sender: sender)
        }
    }
    
    
}

