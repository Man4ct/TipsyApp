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

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true

               //Get the current title of the button that was pressed.
               let buttonTitle = sender.currentTitle!
               
               //Remove the last character (%) from the title then turn it back into a String.
               let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
               
               //Turn the String into a Double.
               let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
               
               //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
               tip = buttonTitleAsANumber / 100
        

        
    }
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

//test
