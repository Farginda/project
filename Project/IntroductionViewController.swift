//
//  IntroductionViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.layer.cornerRadius = 30
        myButton.clipsToBounds = true

        // Do any additional setup after loading the view.
    }
    

}
