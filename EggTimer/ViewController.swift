//
//  ViewController.swift
//  EggTimer
//
//  Created by user212279 on 03/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = [
        "Soft": 300,
        "Medium" : 420,
        "Hard" : 720
    ]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        
//        if sender.currentTitle?.elementsEqual("Soft") == true{
//            print(softTime)
//        }
//        else if sender.currentTitle?.elementsEqual("Medium") == true {
//            print(mediumTime)
//        }
//        else if sender.currentTitle?.elementsEqual("Hard") == true {
//            print(hardTime)
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) /  Float(totalTime)
            
        }
        else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
        }
    }


}

