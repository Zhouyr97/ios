//
//  ViewController.swift
//  Calculator
//
//  Created by  上海海洋大学 on 2017/3/24.
//  Copyright © 2017年  上海海洋大学. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
    let digit = sender.currentTitle!
    if userIsInTheMiddleOfTyping{
         let textCurrentlyInDisplay = display.text!
         display.text = textCurrentlyInDisplay + digit
        }
    else
     {
        display.text = digit
        userIsInTheMiddleOfTyping = true
      }
    }
   
    var displayValue: Double{
        get {
           return Double(display.text!)!
        }
        set{
           display.text = String(newValue)
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
        brain.setOperand(displayValue)
        userIsInTheMiddleOfTyping = false
        }
       
        if  let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(mathmaticalSymbol)
         
        }
        if let result = brain.result{
          displayValue = result
        }
    }
}

