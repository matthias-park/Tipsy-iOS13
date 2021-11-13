//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by JUNSOO PARK on 2021-11-11.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalTips: String?
    var numberOfPeople: String?
    var tip: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        totalLabel.text = totalTips
        settingsLabel.text = "Split between \(numberOfPeople!) people, with \(tip!)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
