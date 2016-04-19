//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: Protocols.playground
//  DATE: 4/19/2016
//  EXERCISE 11: This program demonstrates creating classes
//              with its properties as well as inheritance
//              protocol and delegate design pattern
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

protocol Account {
    var accountNumber: String {get}
    func getBalance()
    func debit(amount: Double)
    func credit(amount: Double)
    func describeAccount()
}


protocol TransactionAuditDelegate {
    func willPerform() -> String
    func performing() -> String
    func didPerform() -> String
    func generateMiniReport()
}


class Debit : TransactionAuditDelegate{
    let timestamp: String
    var amount: Double
    var account: Account
    
    init(account: Account, amount: Double){
        self.amount = amount
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }
    
    func willPerform() -> String {
        return "About to Debit $\(amount) from \(account.accountNumber)"
    }
    func performing() -> String {
        return "Debitting .... "
    }
    func didPerform()-> String {
        return "Debit completed! $\(amount) has been debited from \(account.accountNumber)"
    }
    
    func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
    
}
class Credit : TransactionAuditDelegate{
    let timestamp: String
    var amount: Double
    var account: Account
    
    init(account: Account, amount: Double){
        self.amount = amount
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }
    
    func willPerform() -> String {
        return "About to Credit $\(amount) to \(account.accountNumber)"
    }
    func performing() -> String {
        return "Creditting .... "
    }
    func didPerform()-> String {
        return "Credit completed! $\(amount) has been credited to \(account.accountNumber)"
    }
    
    func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
}
class AddInterest: TransactionAuditDelegate{
    
    let timestamp: String
    var account: Account
    
    init(account: Account){
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }
    func willPerform() -> String {
        return "About to add interest to \(account.accountNumber)"
    }
    func performing() -> String {
        return "Adding Interest .... "
    }
    func didPerform()-> String {
        return "Completed! Current Balance of \(account.accountNumber) is  \(account.getBalance())"
    }
    func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
}


class CreateAccount : TransactionAuditDelegate{
    let timestamp: String
    var customer: Customer
    var account: Account
    
    init(account: Account, customer: Customer){
        self.customer = customer
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }
    
    func willPerform() -> String {
        return "About to create Account"
    }
    func performing() -> String {
        return "Creating an Account for \(customer.getName()) "
    }
    func didPerform()-> String {
        return "Account has been created!"
    }
    
    func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
}



class SavingAccount: Account {
    var accountNumber: String
    unowned var customer: Customer
    var statementReport = Array<TransactionAuditDelegate>()
    
    //Creates account
    init(customer: Customer, AccountNumber accountNumber: String) {
        self.customer = customer
        self.accountNumber = accountNumber
        statementReport.append(CreateAccount(account: self, customer: customer))
    }
    
    var balance: Double = 200.00
    let interest = 2.5
    
    func getBalance(){
        print("\(customer.name) your current Savings Account balance is $\(balance)")
    }
    func debit(amount: Double){
        balance -= amount
        statementReport.append(Debit(account: self, amount: amount))
    }
    func credit(amount: Double){
        balance += amount
        statementReport.append(Credit(account: self, amount: amount))
    }
    func applyInterest() {
        balance *= (interest / 100) + 1
        statementReport.append(AddInterest(account: self))
    }
    func describeAccount(){
        print("Account Number: \(accountNumber)")
        print("Account Name: \(customer.name)")
        print("Current Balance: \(self.balance)")
    }
    
    func financialSummaryReport() -> Array<TransactionAuditDelegate>{
        return self.statementReport
    }
}


class CheckingAccount: Account {
    var accountNumber: String
    unowned var customer: Customer
    var statementReport = Array<TransactionAuditDelegate>()
    
    //Creates account
    init(customer: Customer, AccountNumber accountNumber: String) {
        self.customer = customer
        self.accountNumber = accountNumber
    }
    
    var balance: Double = 0.0
    
    func getBalance(){
        print("\(customer.name) your current Checking Account balance is $\(balance)")
    }
    func debit(amount: Double){
        balance -= amount
        statementReport.append(Debit(account: self, amount: amount))
    }
    func credit(amount: Double){
        balance += amount
        statementReport.append(Credit(account: self, amount: amount))
    }
    func describeAccount(){
        print("Account Number: \(accountNumber)")
        print("Account Name: \(customer.name)")
        print("Current Balance: $\(self.balance)")
    }
    
    func financialSummaryReport() -> Array<TransactionAuditDelegate>{
        return self.statementReport
    }
}

enum AccountType{
    case Savings
    case Checking
}

class Teller{
    
    var name: String
    var accounts = Array<Account>()
    var customers = Array<Customer>()
    
    init(name: String){ self.name = name }
    
    func createAccount(type: AccountType, id: String, owner: Customer){
        //creates a new account to be given to the customer
        //The account is either savings or credit
        switch type{
        case .Savings:
            accounts.append(SavingAccount(customer: owner, AccountNumber: id))
            owner.addAccount(SavingAccount(customer: owner, AccountNumber: id))
            customers.append(owner)
        case .Checking:
            accounts.append(CheckingAccount(customer: owner, AccountNumber: id))
            owner.addAccount(CheckingAccount(customer: owner, AccountNumber: id))
            customers.append(owner)
        }
    }
    
    func openAccount(accountType: AccountType, accountNumber: String, customer: Customer){
        //calls createAccount and gives it customer ... notifies delegates and listeners3
        createAccount(accountType, id: accountNumber, owner: customer)
    }
    
    func credit(amount: Double, accountNumber: String){
        //get customer by Account Number
        //Loop through customers
        var tempAccount: Account
        for person: Customer in customers {
            tempAccount = person.getAccount(accountNumber)
            
            if tempAccount.accountNumber == accountNumber {
                tempAccount.credit(amount)
            }
            else{
                print("The Account Number was not found!")
            }
        }

    }
    
    func debit(amount: Double, accountNumber: String){
        var tempAccount: Account
        for person: Customer in customers {
            tempAccount = person.getAccount(accountNumber)
            
            if tempAccount.accountNumber == accountNumber {
                tempAccount.debit(amount)
            }
            else{
                print("The Account Number was not found!")
            }
        }
    }
    
    deinit {
        print("Teller has been cleared from memory")
    }
}

public class Customer{
    
    var name: String
    
    //Maintains a list of different type of account
    var account = Array<Account>()
    
    init(name: String){
        self.name = name
    }
    
    func addAccount(account: Account) {
        self.account.append(account)
    }
    
    func getAccount(accountNumber: String) -> Account{
        //Loop in main account
        // Returns the Account
        var temporary:  Account?
        for item: Account in account{
            if(item.accountNumber == accountNumber){
                temporary = item
            }
        }
        return temporary!
    }
    
    func getName() -> String{
        return self.name
    }
    
    func checkMyBalanceFor(accountNumber: String) -> String{
        return "\(self.getAccount(accountNumber).describeAccount())"
    }
    
    func financialStatement(){
        
        print("Report")
        for anyAccount in account {
            
            if let theAccount = anyAccount as? CheckingAccount {
                print("\(theAccount.financialSummaryReport())")
            }
            
            if let theAccount = anyAccount as? SavingAccount {
                print("\(theAccount.financialSummaryReport())")
            }
        }
    }
    
}


var bob = Customer(name: "Bob")
var peter = Customer(name: "Peter")

var sue = Teller(name: "Sue")

sue.createAccount(AccountType.Checking, id: "1234", owner: bob)

sue.customers


sue.credit(100.00, accountNumber: "1234")
sue.credit(20.00, accountNumber: "1234")

sue.debit(10.00, accountNumber: "1234")

bob.financialStatement()

sue.createAccount(AccountType.Savings, id: "5678", owner: bob)
sue.credit(5.00, accountNumber: "5678")
sue.debit(1.15, accountNumber: "5678")

bob.checkMyBalanceFor("5678")


sue.createAccount(AccountType.Savings, id: "9101", owner: peter)

peter.checkMyBalanceFor("9101")

sue.accounts













