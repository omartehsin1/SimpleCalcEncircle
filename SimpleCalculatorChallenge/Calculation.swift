//
//  Calculation.swift
//  SimpleCalculatorChallenge
//
//  Created by Omar Tehsin on 2019-08-22.
//  Copyright © 2019 Omar Tehsin. All rights reserved.
//

import Foundation
class Calculation {
    let consoleInOut = ConsoleInputOutput()
    let constants = Constants()
    
    //This function handles the input and output, as well as calling the functions to perform the calculations
    func interactiveMode() {
        consoleInOut.writeMessage("Welcome to Simple Calculator")
        let shouldQuit = false
        while !shouldQuit {
            consoleInOut.writeMessage("To Add or Multiply simply type add or multiply, followed by two digits")
            let input = consoleInOut.getInput()
            let inputToStringArray = stringToArray(input: input)
            let numbers = operationCheck(inputArray: inputToStringArray)
            let output = outputValue(input: input, numbers: numbers)
            consoleInOut.writeMessage("Your total is: \(output)")
        }
    }
    
    //Takes the input from the user and breaks it down into an array
    func stringToArray(input: String) -> [String] {
        let inputArray = input.components(separatedBy: " ")
        return inputArray
    }
    
    //The main function that performs the operation. It evaluates the string array to see whether there is an add or multiply preceding the number
    func operationCheck(inputArray: [String]) -> [Int] {
        var addArray : [String] = []
        var addNumb : Int = 0
        var totalAddition : [Int] = []
        var multiplyArray : [String] = []
        var multiplyNumb = Int()
        var totalMultiplication : [Int] = []
        
        var totalArray : [Int] = []
        
        additionFunction(inputArray, &addArray, &totalAddition, &addNumb, &totalArray)
        
        multiplyFunction(inputArray, &multiplyArray, &totalMultiplication, &multiplyNumb, &totalArray)
        
        return totalArray
    }
    
    //performs the add operation
    fileprivate func additionFunction(_ inputArray: [String], _ addArray: inout [String], _ totalAddition: inout [Int], _ addNumb: inout Int, _ totalArray: inout [Int]) {
        let addIndexes = inputArray.enumerated().filter {$0.element.contains(constants.add)}.map{$0.offset}
        for addIndex in addIndexes {
            addArray.insert(inputArray[addIndex +  1], at: 0)
            addArray.insert(inputArray[addIndex +  2], at: 1)
        }
        for numbs in addArray {
            if numbs.isInt == true {
                totalAddition.append(Int(numbs)!)
                addNumb = totalAddition.reduce(0, +)
            }
        }
        if addNumb != 0 {
            totalArray.append(addNumb)
        }
    }
    
    //performs the multiplication operation
    fileprivate func multiplyFunction(_ inputArray: [String], _ multiplyArray: inout [String], _ totalMultiplication: inout [Int], _ multiplyNumb: inout Int, _ totalArray: inout [Int]) {
        let multiplyIndexes = inputArray.enumerated().filter {$0.element.contains(constants.multiply)}.map{$0.offset}
        for multiplyIndex in multiplyIndexes {
            multiplyArray.insert(inputArray[multiplyIndex + 1], at: 0)
            multiplyArray.insert(inputArray[multiplyIndex + 2], at: 1)
        }
        
        for numbs in multiplyArray {
            if numbs.isInt == true {
                totalMultiplication.append(Int(numbs)!)
                multiplyNumb = totalMultiplication.reduce(1, *)
            }
        }
        totalArray.append(multiplyNumb)
    }
    
    //handles the output
    func outputValue(input: String, numbers: [Int]) -> Int {
        
        if input.starts(with: constants.add) {
            let addTotal = numbers.reduce(0, +)
            return addTotal
        } else if input.starts(with: constants.multiply) {
            let multiplyTotal = numbers.reduce(1, *)
            return multiplyTotal
        } else {
            return Int(input)!
        }
    }
    
}

