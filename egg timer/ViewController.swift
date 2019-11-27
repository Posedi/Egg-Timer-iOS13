//
//  ViewController.swift
//  egg timer
//
//  Created by Madness on 2019-11-27.
//  Copyright © 2019 Mladen Posedi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    //5,7,12 minutes for boiling eggs in seconds
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 0
    var secondsPass = 0
    var player: AVAudioPlayer!
    
            //button selector for Soft Medium and Hard
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
                let hardness = sender.currentTitle!
                totalTime = eggTimes[hardness]!
                
                progressBar.progress = 0.0
                secondsPass = 0
                titleLabel.text = hardness
                
            //timer funcion for countdown
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            }
            //playing sound from a container
            func playSound(soundName: String) {
                let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
            }
            //objc coz its ObjectiveC component
            @objc func updateTimer() {
                if secondsPass < totalTime {
                    secondsPass += 1
                    //float coz probressBar.progress is expecting decimal number
                    progressBar.progress = Float(secondsPass) / Float(totalTime)
                } else {
                    timer.invalidate()
                    titleLabel.text = "DONE"
                    playSound(soundName: "alarm_sound")
                }
            }
        }
