import Foundation


public class Customer : Equatable{
    
    var name: String
    
    //Maintains a list of different type of account
    var checkingAccount = Array<CheckingAccount>()
    var savingsAccount = Array<SavingAccount>()
    
    
    public init(name: String){
        self.name = name
    }
    
    public func addSavings(account: SavingAccount) {
        self.savingsAccount.append(account)
    }
    
    public func addChecking(account: CheckingAccount) {
        self.checkingAccount.append(account)
    }
    
    
    public func getSavingAccount(accountNumber: String) -> SavingAccount {
        var temp: SavingAccount?
        for accounts in savingsAccount{
            if accounts.accountNumber == accountNumber {
                temp = accounts
            }
        }
        return temp!
    }
    
    public func getCheckingAccount(accountNumber: String) -> CheckingAccount {
        var temp: CheckingAccount?
        for accounts in checkingAccount{
            if accounts.accountNumber == accountNumber {
                temp = accounts
            }
        }
        return temp!
    }
    
    public func getName() -> String{
        return self.name
    }
    
    public func checkMyBalanceForChecking(accountNumber: String) -> String{
        return "\(self.getCheckingAccount(accountNumber).describeAccount())"
        
    }
    public func checkMyBalanceForSavings(accountNumber: String) -> String{
        return "\(self.getSavingAccount(accountNumber).describeAccount())"
        
    }
    
    public func financialStatement(){
        
        print("Report")

    }
    
}


public func ==(lhs: Customer, rhs: Customer) -> Bool
{
    return
        lhs.name == rhs.name

}