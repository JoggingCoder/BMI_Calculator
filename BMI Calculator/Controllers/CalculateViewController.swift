//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiValue = "0.0"
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hightSliderChanged(_ sender: UISlider) {
        let val = sender.value
        let finalVal = String(format: "%.2f", val)
        print(finalVal)
        heightLabel.text = finalVal + "m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print(lroundf(sender.value))
        let val2 = sender.value
        let finalVal = lroundf(val2)
        print(finalVal)
        let str1 = String(finalVal)
        weightLabel.text = str1 + "Kg"
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = ((weight)/pow(height, 2))
        print(bmi)
        bmiValue = String(format: "%.1f", bmi)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destivationVC = segue.destination as! ResultsViewController
            destivationVC.bmiValue = bmiValue
        }
    }
}

