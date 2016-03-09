//================================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: HelperMethods.swift
//  DATE: 03/08/2016
//  EXERCISE 5: A collection of methods to perform operations in
//              exercise 5
//=================================================================


import Foundation


// Description: This method calculates the total amount for a given bill in double and returns
//              the string representation of amount to two decimal place. It makes uses of other
//              methods and a double constant minTipAmount of 3.0
// 
// Parameter:   (amount: Double) The given double amount
// Returns:     (String) Returns a String
public func getBillAmount(amount: Double) -> (String){
    var total: Double
    let tipPercentageDeciml = tipDecimal()
    let minTipAmount = 3.00
    let tipAmount = getTip(amount, tipInDecimal: tipPercentageDeciml)
    
    total = (tipAmount > minTipAmount) ? (amount + tipAmount) : (amount + minTipAmount)
    return convertTo2Decimal(total)
}



// Description: This method returns constant integer of 20
//
// Parameter:   () void
// Returns:     (Int) Returns an Integer
public func getTipPercentage() -> (Int){
    let num: Int = 20
    return num
}



// Description: This converts the tip percentage to Double
//              makes use of methed getTipPercentage to get
//              integer of 20
//
// Parameter:   () void
// Returns:     (Double) Returns an Double
public func tipDecimal() -> (Double){
    let tipPercent = (Double(getTipPercentage()))/100.0
    return tipPercent
}


// Description:  Calculates the Tip and returns a double
//
// Parameter:   (amount: Double) The given amount in Double
//              (tipInDecimal: Double) The tip in Double
//
// Returns:     (Double) Returns the calculated amount
public func getTip(amount: Double, tipInDecimal:Double) ->(Double){
    let tip = amount * tipDecimal()
    return tip
}


// Description:  For a given Double value, this method converts it to a string in two decimal places
//
// Parameter:   (numberToConvert: Double) The number to be converted
//
// Returns:     (String) Returns the converted amount to string
public func convertTo2Decimal(numberToConvert: Double) -> (String) {
    let finalConversion = Float64(numberToConvert) + Float64(getTipPercentage() % 1)
    return "\((round(finalConversion * 100.0))/100.0)"
}



// Description:  Methos to extrct a portion of a string
//
// Parameter:   (get:String) The number to be etracted from
//              (fromTheEnd:Int) Integer, starting from this position
//              (toFromTheEnd:Int) Integer, extract up to this position
//
// Returns:     (String) Return the extracted position
public func finder(get:String, fromTheEnd:Int = 0, toFromTheEnd:Int = 3) -> (String){
    let start = get.endIndex.advancedBy(fromTheEnd)
    let end = get.endIndex.advancedBy(toFromTheEnd)
    let foundString = get.substringWithRange(start..<end)
    return foundString
}

//Overloaded method
public func finder(get:String, fromTheFront:Int = 0, toFromTheEnd: Int = 3) -> (String){
    let start = get.startIndex.advancedBy(fromTheFront)
    let end = get.endIndex.advancedBy(toFromTheEnd)
    let found = get.substringWithRange(start..<end)
    return found
}





public func encrypt(message:String, encryptByValue:Int) -> (String){
    
    let smallAlphabets = "abcdefghijklmnopqrstuvwxyz"
    let bigAlphanets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let specialcharacters = "1234567890', "
    
    
    var cipher = " "
    
    for c in message.characters {
        
        var newletter: String = " "
        let letter = String(c)
        
        if specialcharacters.containsString(String(c)){
            newletter = letter
        }
        
        if smallAlphabets.containsString(String(c)) || bigAlphanets.containsString(String(c)){
            
            var range: Range<String.Index>
            var index: Int
            
            if letter.lowercaseString != letter {
                range = bigAlphanets.rangeOfString(letter)!
                index = smallAlphabets.startIndex.distanceTo(range.startIndex)
            }
            else {
                range = smallAlphabets.rangeOfString(letter)!
                index = smallAlphabets.startIndex.distanceTo(range.startIndex)
            }
            
            let newIndex = (index + encryptByValue) % 26
            
            let start: Int = newIndex
            let end: Int = -1 * (25 - newIndex)
            
            if letter.lowercaseString != letter {
                newletter = finder(bigAlphanets, fromTheFront: start, toFromTheEnd: end)
            }
            else {
                newletter = finder(smallAlphabets, fromTheFront: start, toFromTheEnd: end)
            }
        }
        
        cipher += newletter
    }
    return cipher
}





public func decrypt(message:String, decryptByValue:Int) -> (String){
    
    let smallAlphabets = "abcdefghijklmnopqrstuvwxyz"
    let bigAlphanets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let specialcharacters = "1234567890', "
    
    var cipher = " "
    
    for c in message.characters {
        
        var newletter: String = " "
        let letter = String(c)
        
        if specialcharacters.containsString(String(c)){
            newletter = letter
        }
        
        if smallAlphabets.containsString(String(c)) || bigAlphanets.containsString(String(c)){
            
            var range: Range<String.Index>
            var index: Int
            
            if letter.lowercaseString != letter {
                range = bigAlphanets.rangeOfString(letter)!
                index = smallAlphabets.startIndex.distanceTo(range.startIndex)
            }
            else {
                range = smallAlphabets.rangeOfString(letter)!
                index = smallAlphabets.startIndex.distanceTo(range.startIndex)
            }
            
            let newIndex = (index + decryptByValue) % 26
            
            let start: Int = newIndex
            let end: Int = -1 * (25 - newIndex)
            
            if letter.lowercaseString != letter {
                newletter = finder(bigAlphanets, fromTheFront: start, toFromTheEnd: end)
            }
            else {
                newletter = finder(smallAlphabets, fromTheFront: start, toFromTheEnd: end)
            }
        }
        
        cipher += newletter
    }
    return cipher
}



































