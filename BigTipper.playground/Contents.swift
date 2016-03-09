//================================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: BigTipper.playground
//  DATE: 02/16/2016
//  EXERCISE 1: This program demonstrate the use of variables and
//              constants and the use of if statement
//=================================================================

/*:
**Exercise:**
Your a big tipper! When ever you go out to eat you tip 20% of the bill and never tip less than $3. Create a playground that prints the tip amount and the total amount. Within the playground, you should be able to change the bill to see how the tip amount varies.
>> **Example Output:**
* `What is the bill? $x.xx`
* `What is the tip percentage? x`
* `The tip is $x.xx`
* `The total is $x.xx`
*/
// 


import Foundation

let billAmount = 78.99
let tipPercentage = 20
let tipPercentageDecimal = 20.0 / 100.0
let minTipAmount = 3.0

var tipAmount = billAmount * tipPercentageDecimal

if tipAmount < minTipAmount {
    tipAmount = minTipAmount
}

let totalAmount = billAmount + tipAmount

var receipt = (bill: billAmount, tip: tipAmount, billPlusTip: totalAmount)

print(String(format: "What is the bill? $%.2f", totalAmount), terminator: "")
print("What is the bill? $\(tipPercentage)", terminator: "")
print(String(format: "The tip is $%.2f", tipAmount), terminator: "")
print(String(format: "The total is $%.2f", receipt.billPlusTip), terminator: "")











