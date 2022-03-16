//
//  ViewController.swift
//  XyloPhone_app
//
//  Created by AYTAÇ BULANIK on 14.03.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func songButtonPressed(_ sender: UIButton) {
        if let keywords = sender.titleLabel?.text {
            print(keywords)
        }
    }
    
}

