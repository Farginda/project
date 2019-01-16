//
//  HoursViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class HoursViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // outlets
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var hoursPicker: UIDatePicker!
    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func hoursPicked(_ sender: UIDatePicker) {
    
    }
    
    @IBAction func startFastButton(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hoursSegue" {
            let timerViewController = segue.destination as! TimerViewController
            print(hoursPicker.countDownDuration)
//            let sec = Int(timerViewController.seconds)
            timerViewController.seconds = hoursPicker.countDownDuration
        }
    }

}
