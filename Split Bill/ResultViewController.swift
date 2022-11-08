//
//  ResultViewController.swift
//  Split Bill
//
//  Created by Mahmut Şenbek on 8.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var comingResult = "0.0"
    var comingNumberOfPeople = 2
    var comingTip = 10
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(comingTip)
print(comingNumberOfPeople)
        resultLabel.text = comingResult
        
        infoLabel.text = "Split between \(comingNumberOfPeople) people, with \(comingTip)% tip."
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toBackVC", sender: nil)
        
    }
    
   
    
}
