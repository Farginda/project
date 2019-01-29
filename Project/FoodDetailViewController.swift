//
//  FoodDetailViewController.swift
//  Project
//
//  Created by Farginda on 1/8/19.
//  Copyright © 2019 Farginda. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var item: Common!
    var loadImage: CommonPhoto!
    var food: [Common] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        FoodAPIHelper.shared.getFood(searchTerm: "") { results, errorMessage in
            if let results = results {
                self.food = results
            }
            if !errorMessage.isEmpty { print("Search error: " + errorMessage)
            }
            self.updateUI()
        }
    }
    
    func updateUI() {
        titleLabel.text = item.foodName
        let photo = item.photo
        FoodAPIHelper.shared.getImage(url: photo.thumb) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.image.image = image
            }
        }
    }
}
