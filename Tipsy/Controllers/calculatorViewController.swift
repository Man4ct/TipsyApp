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
    var totalAmount = ""
    
    @IBOutlet weak var billTextField: UITextField!
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitTextLabel: UILabel!
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let peopleDivided = Double(splitTextLabel.text!)!
        let amount = Double(billTextField.text!)!
        
        totalAmount = String(round((amount + (amount * tip)) / peopleDivided * 100) / 100.0)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }


    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitTextLabel.text = String(Int(sender.value))
    }
    
    
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        billTextField.endEditing(true)

        
        sender.isSelected = true

               let buttonTitle = sender.currentTitle!
               
               let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
               
               let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
         
               tip = buttonTitleAsANumber / 100
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalAmount = totalAmount
            destinationVC.numberOfPeople = splitTextLabel.text
            destinationVC.tipPercentage = String(tip * 100)
        }
    }
}
