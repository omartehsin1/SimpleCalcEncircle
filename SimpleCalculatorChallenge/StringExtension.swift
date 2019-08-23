//
//  StringExtension.swift
//  SimpleCalculatorChallenge
//
//  Created by Omar Tehsin on 2019-08-22.
//  Copyright © 2019 Omar Tehsin. All rights reserved.
//

import Foundation
//checks whether the string is an int or not
public extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}
