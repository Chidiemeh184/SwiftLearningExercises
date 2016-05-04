import Foundation

public class Teller{
    
    var name: String
    public var accounts = Array<Account>()
    public var customers = [Customer]()
    //public var customers = Array<Customer>()
    
    public init(name: String){ self.name = name }
    
    public func createAccount(type: AccountType, id: String, owner: Customer){
        //creates a new account to be given to the customer
        //The account is either savings or credit
        switch type{
        case .Savings:
            accounts.append(SavingAccount(customer: owner, AccountNumber: id))
            owner.addSavings(SavingAccount(customer: owner, AccountNumber: id))
            customers.append(owner)
        case .Checking:
            accounts.append(CheckingAccount(customer: owner, AccountNumber: id))
            owner.addChecking(CheckingAccount(customer: owner, AccountNumber: id))
            customers.append(owner)
        }
    }
    
    public func openAccount(accountType: AccountType, accountNumber: String, customer: Customer){
        //calls createAccount and gives it customer ... notifies delegates and listeners3
        createAccount(accountType, id: accountNumber, owner: customer)
    }
    

    
     deinit {
        print("Teller has been cleared from memory")
    }
}


extension Teller {
   
    public func credit(customer: Customer, accountType: AccountType, accountNumber: String, amount: Double){
        
        for person in customers {
            
            if person == customer {
                
                switch accountType {
                case .Savings:
                    let sA = person.getSavingAccount(accountNumber) //.credit(amount)
                    sA.credit(amount)
                    break
                case .Checking:
                    person.getCheckingAccount(accountNumber).credit(amount)
                    break
                }
            }
        }//end for
        
    }
    
    public func debit(customer: Customer, accountType: AccountType, accountNumber: String, amount: Double){
        for person in customers {
            
            if person == customer {
                
                switch accountType {
                case .Savings:
                    person.getSavingAccount(accountNumber).debit(amount)
                    //sA.credit(amount)
                case .Checking:
                    person.getCheckingAccount(accountNumber).debit(amount)
                    
                }
            }
        }//end for
    }
    
}

