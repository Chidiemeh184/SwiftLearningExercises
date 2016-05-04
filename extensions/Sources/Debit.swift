import Foundation

public class Debit {
    let timestamp: String
    var amount: Double
    var account: Account
    
    public init(account: Account, amount: Double){
        self.amount = amount
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }
    

}

extension Debit : TransactionAuditDelegate {
   
    public func willPerform() -> String{
        return "About to Debit $\(amount) from \(account.accountNumber)"
    }
    public func performing() -> String{
        return "Debitting .... "
    }
    public func didPerform() -> String{
        return "Debit completed! $\(amount) has been debited from \(account.accountNumber)"
    }
    
    public func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
}