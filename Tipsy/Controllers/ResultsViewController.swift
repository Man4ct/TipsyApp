//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Fahmi Fahreza on 04/04/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var totalLabel: UILabel!
    var numberOfPeople: String?
    var tipPercentage: String?
    
    var totalAmount: String?
    @IBOutlet weak var settingsLabel: UILabel!
  
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalAmount
        settingsLabel.text = "Split between \(numberOfPeople ?? "2") people, with \(tipPercentage ?? "0")% tip "

    }
    


}
