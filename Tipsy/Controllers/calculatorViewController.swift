//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class calculatorViewController: UIViewController {
    var tip = 0.10

    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitTextLabel: UILabel!
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitTextLabel.text = String(Int(sender.value))
    }
    
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true

               let buttonTitle = sender.currentTitle!
               
               let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
               
               let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
         
               tip = buttonTitleAsANumber / 100
        
    }
}

