//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Rohit Kumar on 28/07/23.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorbrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var BMI : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
    
        let height = (String (format: "%.2f", sender.value))
        heightLabel.text = "\(height) m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
      
        let weight = (String(format : "%.0f" , sender.value))
        weightLabel.text = "\(weight) Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = (heightSlider.value)
        let weight = (weightSlider.value)
        
        calculatorbrain.calculateBMI(height : height , weight : weight)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController  // Downcasting
            destinationVC.bmiValue = calculatorbrain.getBMIValue()
            destinationVC.advice = calculatorbrain.getAdvice()
            destinationVC.color = calculatorbrain.getColor()
        }
    }
}

