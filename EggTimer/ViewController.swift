//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    let eggTimes = [ "Soft" : 3, "Hard" : 7, "Medium" : 5]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    var player : AVAudioPlayer!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sectimer),userInfo: nil, repeats: true)
        progressBar.progress = 0.0
        secondsPassed = 0 ;
        tittle.text = hardness;
    }
    
    
    @objc func sectimer(){
        if secondsPassed<totalTime {
            secondsPassed+=1;
          let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
            
        }
        else{
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            timer.invalidate()
            tittle.text="DONE"
        }
       
    }
    

}
