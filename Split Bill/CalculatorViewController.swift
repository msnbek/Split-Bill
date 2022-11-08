//
//  ViewController.swift
//  Split Bill
//
//  Created by Mahmut Şenbek on 8.11.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var splitLabelText: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var selectTip: UILabel!
    
    var tip = 0.10
    var totalBill = 0.0
    var stepper = 2
    var finalResult = "0.0"
  
    
  
   
    
     override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesure = UITapGestureRecognizer(target: self, action: #selector(hiddenKeyboard))
        view.addGestureRecognizer(tapGesure)
    }
    @objc func hiddenKeyboard() {
        
        view.endEditing(true)
    }
    

    
    
    
    @IBAction func stepper(_ sender: UIStepper) {
    
        
        splitLabelText.text = String(format: "%.0f", sender.value)
        stepper = Int(sender.value)
       
        
    }
    
    @IBAction func percentChanged(_ sender: UIButton) {
        
        let buttonSender = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonSender.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
       
        if buttonSender == "0%" {
         
            zeroPercent.isSelected = true
            tenPercent.isSelected = false
            twentyPercent.isSelected = false
            print("zero selected")
        } else if buttonSender  == "10%" {
            
            zeroPercent.isSelected = false
            tenPercent.isSelected = true
            twentyPercent.isSelected = false
           print("ten")
        }else {
            print("twenty")
            zeroPercent.isSelected = false
            tenPercent.isSelected = false
            twentyPercent.isSelected = true
        }
       
        
  
        }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = textField.text
        if bill != "" {
            totalBill = Double(bill!)!
            let result = totalBill * (1 + tip) / Double(stepper)
            finalResult = String(format: "%.2f", result)
            print(finalResult)
            performSegue(withIdentifier: "toResultVC", sender: nil)
        }else {
            if textField.text == "" {
                let alert = UIAlertController(title: "Error", message: "Please Write Something!", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
                present(alert, animated: true)
                alert.addAction(okButton)
            }
        }
        /*
        if zeroPercent.isSelected == true {
            if let newBill = Double(textField.text!) {
                totalBill = newBill
                print(totalBill)
                let stepper = Double(splitLabelText.text!)
                let newZeroPercent = String(totalBill / stepper!)
                print(newZeroPercent)
                result = String(format: "%.5f", newZeroPercent)
                print(result)
            }
        }else if tenPercent.isSelected == true {
        print("seçtim")
            if let newBill = Double(textField.text!) {
                totalBill = newBill
                let stepper = Double(splitLabelText.text!)
                let bill = ((totalBill * tip) + totalBill )
        
                var tenPercentResult = String(bill / stepper!)
                print(tenPercentResult)
               result = String(format: "%.3f", tenPercentResult)
                print(result)
            }
        }else if twentyPercent.currentTitle == "20%" {
            if let newBill = Double(textField.text!) {
                totalBill = newBill
                textField.text = String(totalBill)
                print(totalBill)
                let stepper = Double(splitLabelText.text!)
                let bill = ((totalBill * 0.2) + totalBill )
                var twentyPercentResult = String(bill / stepper!)
                print(twentyPercentResult)
                twentyPercentResult = result
                print(result)
            }
        }
        if textField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please Write Something!", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
            present(alert, animated: true)
            alert.addAction(okButton)
        }
        performSegue(withIdentifier: "toResultVC", sender: nil)
        
        */
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultVC" {
            let destination = segue.destination as! ResultViewController
            destination.comingResult = finalResult
            destination.comingNumberOfPeople = Int(stepper)
            destination.comingTip =  Int(tip * 100)
        }
    }
        
        
    }
    
    

