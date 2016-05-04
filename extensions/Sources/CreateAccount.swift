import Foundation


public class CreateAccount {
    let timestamp: String
    var customer: Customer
    var account: Account
    
    init(account: Account, customer: Customer){
        self.customer = customer
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }
}

extension CreateAccount: TransactionAuditDelegate {
    public func willPerform() -> String {
        return "About to create Account"
    }
    public func performing() -> String {
        return "Creating an Account for \(customer.getName()) "
    }
    public func didPerform()-> String {
        return "Account has been created!"
    }
    
    public func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
    
}