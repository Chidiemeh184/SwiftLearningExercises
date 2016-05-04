//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: Protocols.playground
//  DATE: 5/4/2016
//  EXERCISE 12: This program demonstrates creating classes
//              with its properties as well as inheritance
//              protocol and delegate design pattern and extension
//=============================================================


/*:
- - -
* callout(Exercise): Leveraging protocols and the delegation design pattern, your task is to build a simple bank teller system. The teller’s job responsibilities are to open, credit, debit savings and checking accounts. The teller is not sure what really happens when they perform their responsibilities, it just works.

**Constraints:**
- Create an audit delegate that tracks when an account is opened, credited and debited
- Create a protocol for which a savings and checking accounts need to conform
- Create a teller class with customers and accounts
- Perform the teller's responsibilities
*/

import Foundation


var bob = Customer(name: "Bob")
var peter = Customer(name: "Peter")

var sue = Teller(name: "Sue")

sue.createAccount(AccountType.Checking, id: "1234", owner: bob)
sue.createAccount(AccountType.Savings, id: "5678", owner: bob)

sue.credit(bob, accountType: AccountType.Checking, accountNumber: "1234", amount: 10.00)
//sue.credit(bob, accountType: AccountType.Savings, accountNumber: "5678", amount: 150.00)
//sue.credit(bob, accountType: AccountType.Checking, accountNumber: "1234", amount: 10.00)
//sue.credit(bob, accountType: AccountType.Savings, accountNumber: "5678", amount: 15.00)

bob.checkMyBalanceForChecking("1234")
print(" ")
bob.checkMyBalanceForSavings("5678")

//
//sue.createAccount(AccountType.Checking, id: "1122", owner: peter)
//sue.createAccount(AccountType.Savings, id: "1133", owner: peter)
//sue.credit(peter, accountType: AccountType.Checking, accountNumber: "1122", amount: 10.00)
//sue.credit(peter, accountType: AccountType.Savings, accountNumber: "1133", amount: 15.00)
//
//print(" ")
//peter.checkMyBalanceForChecking("1122")
//print(" ")
//peter.checkMyBalanceForSavings("1133")
//
//
//
//sue.accounts














