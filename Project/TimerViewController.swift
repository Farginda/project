//
//  TimerViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    let foodHelper = FoodAPIHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
    }
    
    var seconds: Double!
    var timer = Timer()
    var isTimerRunning = false
    
    // outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopTimerButton: UIButton!
    @IBOutlet weak var FoodInspoButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    // stop timer
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        timer.invalidate()
    }
    
    // initializing timer
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    // update timer with decreasing seconds
    @objc func updateTimer() {
        if seconds < 1 {
            timer.invalidate()
            timer.fire() // check?
            // SEND NOTIFICATION OR ALERT
        } else {
            seconds = seconds - 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    // puts timer in hours : minutes : seconds
    func timeString(time: TimeInterval) -> String {
//        let hours = self.seconds * 3600
//        let minutes = self.seconds * 60
//        let seconds = self.seconds
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    func updateUI(with foodHelper: [FoodAPIHelper]) {
        DispatchQueue.main.async {
            self.foodHelper = foodHelper
            self.reloadData()
        }
    }
    @IBAction func foodInspoButtonPressed(_ sender: UIButton) {
        FoodAPIHelper.shared.getFood(completion:) { ([Food]?) in
            if let foodHelper = foodHelper {
                self.updateUI(with: foodHelper)
            }
        }
    }

}
