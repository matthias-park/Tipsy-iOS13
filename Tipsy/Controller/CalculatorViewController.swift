//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.00
        } else if sender.currentTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tip = 0.10
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tip = 0.20
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        if sender.value <= 12 {
            splitNumberLabel.text = String(format: "%.0f", sender.value)
            numberOfPeople = Int(sender.value)
        } else {
            splitNumberLabel.text = "2"
            sender.value = 2
            numberOfPeople = Int(sender.value)
        }
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
            if bill != "" {
                billTotal = Double(bill)!
                let result = billTotal * (1 + tip) / Double(numberOfPeople)
                finalResult = String(format: "%.2f", result)
               }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalTips = finalResult
            destinationVC.numberOfPeople = String(numberOfPeople)
            destinationVC.tip = String(tip*100)
        }
    }
}

