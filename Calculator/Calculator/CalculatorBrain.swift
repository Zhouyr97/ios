//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by  上海海洋大学 on 2017/3/31.
//  Copyright © 2017年  上海海洋大学. All rights reserved.
//

import Foundation
func changeSign(operand: Double) -> Double{
    
    return -operand
}

struct  CalculatorBrain{
   
    private var accumlator: Double?
    
    private enum Operation{
       case constant(Double)
       case unaryOperation((Double) -> (Double))
        case binaryOperation((Double,Double) -> Double)
        case equals
      
    }
    
    private var operations : Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos":Operation.unaryOperation(cos),
        "±":Operation.unaryOperation({ -$0 }),
        "×":Operation.binaryOperation({ $0 * $1}),
        "÷":Operation.binaryOperation({$0 / $1}),
        "+":Operation.binaryOperation({$0 + $1}),
        "−":Operation.binaryOperation({$0 - $1}),
        "=":Operation.equals,
    ]
    mutating func performOperation(_ symbol: String) {
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let Value):
               accumlator = Value
            case .unaryOperation(let function):
                if accumlator != nil {
                    accumlator = function(accumlator!)
                }
            case.binaryOperation(let funcation):
                if accumlator != nil {
                    pbo = PendingBinaryOperation(function: funcation, firstOperand: accumlator!)
                    accumlator = nil
                }
                break
            case .equals:
                performPendingBinaryOperation()
            }
        }
    }
    
    private mutating func performPendingBinaryOperation(){
        if pbo != nil && accumlator != nil {
            accumlator = pbo!.perform(with: accumlator!)
            pbo = nil
        }
        
    }
    
    private var pbo :PendingBinaryOperation?
    
    private struct PendingBinaryOperation{
        let function :(Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand,secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
       accumlator = operand
    }

    var result : Double? {
        get {
             return accumlator
        }
    }
    
}
