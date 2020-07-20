//
//  ViewController.swift
//  Tipsy
//
//  Created by Abdelrahman on 2/22/20.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var TwentyBtn: UIButton!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var TenBtn: UIButton!
    @IBOutlet weak var zeroBtn: UIButton!
    
    var peopleNum: Int = 2
    var billTotal: Float = 0.0
    var tipAmount: Int = 10
    var finalBill: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",stepper.value)
        peopleNum = Int(stepper.value)
        
    }
    @IBAction func tipchanged(_ sender: UIButton) {
        zeroBtn.isSelected = false
        TenBtn.isSelected = false
        TwentyBtn.isSelected = false
        sender.isSelected = true
        
        if sender.currentTitle == "0%"{
             tipAmount = 0
        }else if sender.currentTitle == "10%"{
            tipAmount = 10
        }else{
            tipAmount = 20
        }
       
        billTextField.endEditing(true)
        
    }
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        if let saveText = billTextField.text, let saveFloat = Float(saveText) {
             let res = saveFloat
            if tipAmount != 0 {
                billTotal = (res + ((Float(tipAmount) * res)/100.0)) / Float(peopleNum)
            }else {
                billTotal = res / Float(peopleNum)
            }
        }
      
//        finalBill = String(format: "%.1f", billTotal )
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.numOfPeople = peopleNum
        destinationVC.tipsAmount = tipAmount
        destinationVC.result = billTotal
    }
}

