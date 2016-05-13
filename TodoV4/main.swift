//
//  main.swift
//  TodoV3
//
//  Created by Chidi Emeh on 4/26/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import Foundation

//print("Hello, World!")
//
//let temp = readLine(stripNewline: true)!
//print(temp)
//
//
//func input() -> String {
//    let keyboard = NSFileHandle.fileHandleWithStandardInput()
//    let inputData = keyboard.availableData
//    return NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
//}
//
//print("Enter your name")
//var name = input()
//print("you typed: \(name)")


func getInt() -> Int {
   
    print("Enter an Integer")
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

func getString() -> String{
    
    print("Enter a String")
    let temp = readLine(stripNewline: true)!
    return temp
}

func getDouble() -> Double {
    
    print("Enter a Double")
    let temp = readLine(stripNewline: true)
    var got: Double
    if let num = Double(temp!) {
        got = num
    } else {
        got = 0.0
        print("You entered a letter")
    }
    return got
}


func mult(f: Int, s:Int) -> Int{
    return f / s
}


func mult(f: Double, s:Double) -> Double{
    return f / s
}

var one = getDouble()
var two = getDouble()

var stem = mult(one, s: two)
print("\(stem)")














