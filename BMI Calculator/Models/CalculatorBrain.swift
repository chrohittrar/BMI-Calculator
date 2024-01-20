//
//  calculatorBrain.swift
//  BMI Calculator
//
//  Created by Rohit Kumar on 28/07/23.
//

import UIKit

struct CalculatorBrain {
//    var height : Float
//    var weight : Float
//    var BMI : Float
//
//    init(height : Float , weight : Float ) {
//        self.height = height
//        self.weight = weight
//    }
    
    var bmi : BMI?
    
    func getBMIValue () -> String {
        
        let bmiTo1DecimalPlace = String(format : "%.1f", bmi?.value ?? 0.0 )
            return bmiTo1DecimalPlace
        
}
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.black
    }
    
    mutating func calculateBMI(height: Float, weight : Float) {
        let bmiValue = ( weight / pow(height, 2))
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat More Pies.", color: UIColor.blue)
        }else if bmiValue >= 18.5 && bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a Fiddle.", color: UIColor.green)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less Pies.", color: UIColor.red)
        }
    }
}
 
