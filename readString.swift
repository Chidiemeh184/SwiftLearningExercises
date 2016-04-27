//
//  readString.swift
//  TodoV3_Executable
//
//  Created by Chidi Emeh on 4/26/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import Foundation
//Gets a String
public func readString() -> String{
    
    //print("Enter a String")
    let temp = readLine(stripNewline: true)!
    return temp
}