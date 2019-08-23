//
//  ConsoleInputOutput.swift
//  SimpleCalculatorChallenge
//
//  Created by Omar Tehsin on 2019-08-22.
//  Copyright © 2019 Omar Tehsin. All rights reserved.
//

import Foundation
enum OutputType {
    case error
    case standard
}
class ConsoleInputOutput {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\(message)")
        case .error:
            fputs("Error: \(message)\n", stderr)
        }
    }
    //Gets the input from the use
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
