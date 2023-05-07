//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Fahmi Fahreza on 04/04/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var totalLabel: UILabel!
    var numberOfPeople: String?
    var tipPercentage: String?
    var settingsLabelText: String {
        let people = numberOfPeople ?? "2"
        let tip = tipPercentage ?? "0"
        return "Split between \(people) people, with \(tip)% tip"
    }
    lazy var formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "id_ID")
        formatter.currencyCode = "IDR"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()

    var totalAmount: String?
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let totalAmount = totalAmount, let total = Double(totalAmount) {
            totalLabel.text = formatter.string(from: NSNumber(value: total))
        } else {
            totalLabel.text = formatter.string(from: 0)
        };
        settingsLabel.text = settingsLabelText
        
    }
}
