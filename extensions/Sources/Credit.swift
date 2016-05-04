import Foundation


public class Credit {
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

extension Credit : TransactionAuditDelegate {
    
    public func willPerform() -> String{
        return "About to Credit $\(amount) to \(account.accountNumber)"
    }
    public func performing() -> String{
        return "Creditting .... "
    }
    public func didPerform() -> String {
        return "Credit completed! $\(amount) has been credited to \(account.accountNumber)"
    }
    
    public func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
}