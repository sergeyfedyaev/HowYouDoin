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
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageLabel.alpha = 0
    }
    
    @IBAction func sayButtonPressed(_ sender: UIButton) {
        imageLabel.alpha == 1 
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "audio", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
}

