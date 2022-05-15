//
//  ViewController.swift
//  XyloPhone_app
//
//  Created by AYTAÇ BULANIK on 14.03.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {

    var songBrain = SongBrain()
    var player : AVAudioPlayer!
    var recordingSession : AVAudioSession!
    var audioRecorder : AVAudioRecorder!
    
    @IBOutlet weak var recordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                    DispatchQueue.main.async {
                        if allowed {
                           // self.loadRecordingUI()
                        } else {
                            // failed to record!
                        }
                    }
                }
        }catch {
            print(error.localizedDescription)
        }
    }

   
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let buttonName = sender.currentTitle {
            songBrain.songPlay(name: buttonName)
            sender.alpha = 0.5
            songBrain.buttonColorChanged(sender: sender)
        }
    }
    
    @IBAction func soundRecordButton(_ sender: UIButton) {
        func recordTapped() {
            if audioRecorder == nil {
               // startRecording()
            } else {
               // finishRecording(success: true)
            }
        }
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func startRecording() {
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()

           // recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
          //  finishRecording(success: false)
        }
    }
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil

        if success {
            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
}

