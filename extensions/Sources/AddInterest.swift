import Foundation

public class AddInterest {
    
    let timestamp: String
    var account: Account
    
    public init(account: Account){
        self.account = account
        timestamp = "\(NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle))"
        generateMiniReport()
    }

}

extension AddInterest: TransactionAuditDelegate {
   
    public func willPerform() -> String {
        return "About to add interest to \(account.accountNumber)"
    }
    public func performing() -> String {
        return "Adding Interest .... "
    }
    public func didPerform()-> String {
        return "Completed! Current Balance of \(account.accountNumber) is  \(account.getBalance())"
    }
    public func generateMiniReport(){
        print(willPerform())
        print(performing())
        print(didPerform())
        print(timestamp)
    }
}