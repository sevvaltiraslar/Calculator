//
//  ViewController.swift
//  Calculator
//
//  Created by SEVVAL on 27.09.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var calculateLabel: UILabel!
    
    private var isFinishedNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("The enter text cannot be converted to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapDigitButton(_ sender: UIButton) {
        
        //They will happen when a number button is pressed.
        
        if let numberValue = sender.currentTitle {
            if isFinishedNumber {
                displayLabel.text = numberValue
                isFinishedNumber = false
            } else {
                if numberValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if (!isInt) {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numberValue
            }
        }
        
    }
    
    
    @IBAction func didTapOperandButton(_ sender: UIButton) {
        
        //They will happen when a non-number button is pressed.
        
        isFinishedNumber = true
        calculator.setNumber(displayValue)
        if let calculateMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calculateMethod) {
                displayValue = result
            }
        }
        
    }
    
}

