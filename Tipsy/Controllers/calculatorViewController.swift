//
//  ViewController.swift
//  Tipsy
//
//  Created by Fahmi Fahreza on 04/04/23.
//

import UIKit

class calculatorViewController: UIViewController {
    var tip = 0.10
    var totalAmount = 0.0
    
    @IBOutlet weak var billTextField: UITextField!
    
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitTextLabel: UILabel!
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let peopleDivided = Double(splitTextLabel.text ?? "2") else {
            return
        }
        guard let amount = Double(billTextField.text ?? "0.0") else {
            return
        }
        
        
        totalAmount = (amount + (amount * tip)) / peopleDivided;
        print(peopleDivided)
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
        let buttonTitle =  String(sender.currentTitle!.dropLast())

        tip = Double(buttonTitle)! / 100.0
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalAmount = String(format: "%.2f",totalAmount)
            destinationVC.numberOfPeople = splitTextLabel.text
            destinationVC.tipPercentage = String(tip * 100)
        }
    }
}
