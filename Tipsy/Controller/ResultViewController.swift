//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Abdelrahman on 2/22/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result:Float = 0.25
    var numOfPeople = 2
    var tipsAmount = 10
    
    @IBAction func recalculteBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(format:"%.2f", result)
        splitLabel.text = "Split between \(numOfPeople) people, with \(tipsAmount)% tip."
    }

}
