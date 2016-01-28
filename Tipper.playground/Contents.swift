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
// Name: Chidi Emeh
// Class: BigTipper
// Description: This class calculates and displays
//              information for a tipper based on
//              the given inputs.


import Foundation


class BigTipper{
    
    //---------------------------
    //   Declare Variables     //
    //--------------------------
    let minimumTip: Double
    var billedAmount: Double?
    var givenTip: Int
    let tipPercent: Double
    var tipAmount: Double
    var total: Double?
    var name: String = ""
    
 
    //-----------------------------------------
    //   CONSTRUCTOR: Initialize Variables   //
    //----------------------------------------
    
    init(amount: Double, name: String ){
        self.billedAmount = amount
        self.name = name
        tipAmount = 0.00
        total = 0.00
        tipPercent = Double(20.00/100.00)
        givenTip = 20
        minimumTip = 3.00
    }
    
    
    //----------------------------------------------
    //   PERFORM CALCULATIONS: Return Variables   //
    //---------------------------------------------
    
    
    func getInfo() -> (billAmount: Double, tip: Double, total: Double ) {
        
        tipAmount  = billedAmount! * tipPercent
        
        if tipAmount < minimumTip{
            tipAmount = minimumTip
        }
        
        if total != nil {
            total = billedAmount! + tipAmount
        }
        
         return (billedAmount!, tipAmount, total!)
    }
    
    
    //-------------------------------------------
    //    DISPLAY RESULTS: Print Information   //
    //-------------------------------------------
    
    
    func displayInfo() -> () {
        
        let printReceipt = getInfo()
        let unicodeDot: String = "\u{25C8}"

        
        print(String(format: "\(unicodeDot)   What is the bill?  $%.2f", printReceipt.billAmount), terminator: "")
        print("\(unicodeDot)  What is the tip percentage?  \(self.givenTip)", terminator: "")
        print(String(format: "\(unicodeDot)   The tip is  $%.2f", printReceipt.tip), terminator: "")
        print(String(format: "\(unicodeDot)   The total is  $%.2f", printReceipt.total), terminator: "")
    }
    
}


//Test Class
let customer2 = BigTipper(amount: 78.99, name: "Bob")
print(customer2.getInfo())
print(customer2.displayInfo())
print(customer2.name)


