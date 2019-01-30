//
//  TimerViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopTimerButton: UIButton!
    @IBOutlet weak var FoodInspoButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    var foodHelper = FoodAPIHelper()
    var seconds: Double!
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.layer.cornerRadius = 90
        timerLabel.clipsToBounds = true
        runTimer()
    }
    
    // unwind to view with running timer
    @IBAction func unwindToTimerViewController(segue:UIStoryboardSegue) {
    }
  
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
        if seconds < 1.0 {
            timer.invalidate()
            timer.fire()
            performSegue(withIdentifier: "FinishedSegue", sender: self)
        } else {
            seconds = seconds - 1.0
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    // puts timer in hours : minutes : seconds
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    // perform segue when button pressed
    @IBAction func foodInspoButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "FoodApiSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FinishedSegue" {
            let finishedViewController = segue.destination as! FinishedViewController
            finishedViewController.seconds = seconds.rounded()
        }
    }
}
