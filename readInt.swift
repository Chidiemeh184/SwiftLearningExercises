//
//  readInt.swift
//  TodoV3_Executable
//
//  Created by Chidi Emeh on 4/26/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import Foundation

//Get an Integer or Sets to 0
public func readInt() -> Int {
    
    //print("Enter an Integer")
    let temp = readLine(stripNewline: true)
    var got: Int
    if let num = Int(temp!) {
        got = num
    } else {
        got = 0
        print("You enteres a letter")
    }
    return got
}