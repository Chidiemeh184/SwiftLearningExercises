import Foundation

public class CheckingAccount: Account {
    public var accountNumber: String
    var customer: Customer
    var statementReport = Array<TransactionAuditDelegate>()
    
    //Creates account
    init(customer: Customer, AccountNumber accountNumber: String) {
        self.customer = customer
        self.accountNumber = accountNumber
    }
    
    var balance: Double = 0.0
    
    public func getBalance(){
        print("\(customer.name) your current Checking Account balance is $\(balance)")
    }
    public func debit(amount: Double){
        balance -= amount
        statementReport.append(Debit(account: self, amount: amount))
    }
    public func credit(amount: Double){
        balance += amount
        statementReport.append(Credit(account: self, amount: amount))
    }
    public func describeAccount(){
        print("Account Number: \(accountNumber)")
        print("Account Name: \(customer.name)")
        print("Current Balance: $\(self.balance)")
    }

}

extension CheckingAccount {
    
    func financialSummaryReport() -> Array<TransactionAuditDelegate>{
        return self.statementReport
    }
}


public class SavingAccount: Account{
    public var accountNumber: String
    var customer: Customer
    var statementReport = Array<TransactionAuditDelegate>()
    
    //Creates account
    init(customer: Customer, AccountNumber accountNumber: String) {
        self.customer = customer
        self.accountNumber = accountNumber
    }
    
    var balance: Double = 200.00
    let interest = 2.5
    
    public func getBalance(){
        print("\(customer.name) your current Savings Account balance is $\(balance)")
    }
    public func debit(amount: Double){
        balance -= amount
        statementReport.append(Debit(account: self, amount: amount))
    }
    public func credit(amount: Double){
        balance += amount
        statementReport.append(Credit(account: self, amount: amount))
    }
    func applyInterest() {
        balance *= (interest / 100) + 1
        statementReport.append(AddInterest(account: self))
    }
    public func describeAccount(){
        print("Account Number: \(accountNumber)")
        print("Account Name: \(customer.name)")
        print("Current Balance: \(self.balance)")
    }
    
}



extension SavingAccount {
    
    public func financialSummaryReport() -> Array<TransactionAuditDelegate>{
        return self.statementReport
    }
}

