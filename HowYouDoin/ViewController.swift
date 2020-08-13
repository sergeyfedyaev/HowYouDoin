//
//  ViewController.swift
//  HowYouDoin
//
//  Created by Сергей Федяев on 13.08.2020.
//  Copyright © 2020 Sergey Fedyaev. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var sayButton: UIButton!
    var player: AVAudioPlayer!
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageLabel.alpha = 0
        sayButton.layer.cornerRadius = 20
    }
    
    @IBAction func sayButtonPressed(_ sender: UIButton) {
        imageLabel.alpha = 1
        playSound()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if counter < 2 {
            counter += 1
        } else {
            sayButton.isEnabled = true
            imageLabel.alpha = 0
            timer.invalidate()
            counter = 0
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "audio", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            sayButton.isEnabled = false
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}

