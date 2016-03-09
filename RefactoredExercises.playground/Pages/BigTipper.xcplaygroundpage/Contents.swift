//================================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: BigTipper.playground
//  DATE: 03/08/2016
//  EXERCISE 1: This program demonstrate the use of variables and
//              constants and the use of if statement.
//              This is a refactored version.
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
//Results

let bill = 79.78

print("What is the bill? $\(bill)")
print("What is the tip percentage? \(getTipPercentage())%")
print("The tip is $\(convertTo2Decimal(getTip(bill, tipInDecimal: tipDecimal())))")
print("The total is $\(getBillAmount(bill))")

//: [Previous](@previous) < > [Next](@next)
