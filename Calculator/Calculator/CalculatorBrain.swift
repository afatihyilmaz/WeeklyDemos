//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    //istenen işlemler + - * / bonus C CE =
    //standford university ios 9 > youtube video 1 ya da 2
    private var accumulator: Double = 0.0
    private var temporary: Double = 0

    var result: Double {
        get {
            return accumulator
        }
    }

    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }

        switch operation {
        case "√" :
            accumulator = sqrt(result)
        case "=" :
            runBinaryOperationInfo()
        case "+" :
            runBinaryOperationInfo()
            opInfo = OperationInfo(binaryOperation: sum(number1:number2:), firstOperand: accumulator)
        case "-" :
            runBinaryOperationInfo()
            opInfo = OperationInfo(binaryOperation: extraction(number1:number2:), firstOperand: accumulator)
        case "*" :
            runBinaryOperationInfo()
            opInfo = OperationInfo(binaryOperation: multiply(number1:number2:), firstOperand: accumulator)
        case "/" :
            runBinaryOperationInfo()
            opInfo = OperationInfo(binaryOperation: divide(number1:number2:), firstOperand: accumulator)
        case "C" :
            // Clear all data
            opInfo?.firstOperand = 0
            accumulator = 0.0
            runBinaryOperationInfo()
        case "CE":
            //Clear last data
            accumulator = 0.0
        default:
            break
        }
    }

    func setOperand(_ value: Double) {
        accumulator = value
    }
    
    func sum(number1: Double, number2: Double) -> Double{        return number1 + number2 }
    func extraction(number1: Double, number2: Double) -> Double{ return number1 - number2 }
    func multiply(number1: Double, number2: Double) -> Double{   return number1 * number2 }
    func divide(number1: Double, number2: Double) -> Double{     return number1 / number2 }
   
    
    struct OperationInfo {
        var binaryOperation: (Double, Double) -> Double
        var firstOperand: Double
    }
    private var opInfo: OperationInfo?
    
    private func runBinaryOperationInfo() {
        if opInfo != nil {
            accumulator = opInfo!.binaryOperation(opInfo!.firstOperand, accumulator)
            opInfo = nil
        }
    }
}
