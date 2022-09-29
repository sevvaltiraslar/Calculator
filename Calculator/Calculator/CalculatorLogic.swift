//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by SEVVAL on 29.09.2022.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    private var operations: String?
    private var intermadiateCalculation: (firstNumber: Double, calculateMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    //Mutating: A keyword used to modify it's presence in the Struct.
    
    mutating func calculate(symbol: String) -> Double? {
        
        //Custom logic operations
        
        if let num = number {
            switch symbol {
            case "+/-":
                return num * -1
            case "AC":
                return 0
            case "%":
                return num * 0.01
            case "=":
                return numbersCalculation(sencondNumber: num)
            default:
                intermadiateCalculation = (firstNumber: num, calculateMethod: symbol)
            }
        }
        return nil
    }
    
    private func numbersCalculation(sencondNumber: Double) -> Double? {
        
        //Logic operations
        
        if let firstNumber = intermadiateCalculation?.firstNumber,
           let operation = intermadiateCalculation?.calculateMethod {
            switch operation {
            case "+":
                return firstNumber + sencondNumber
            case "-":
                return firstNumber - sencondNumber
            case "×":
                return firstNumber * sencondNumber
            case "÷":
                return firstNumber / sencondNumber
            case "x³":
                return firstNumber * firstNumber * firstNumber
            case "√x":
                return sqrt(firstNumber)
            case "∛x":
                return pow(firstNumber, 1/3)
            case "1/x":
                return 1 / firstNumber
            default:
                fatalError("Operation does not match.")
            }
        }
        return nil
    }
    
}

