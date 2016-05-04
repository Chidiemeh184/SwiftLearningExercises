import Foundation

public protocol Account {
    var accountNumber: String {get}
    func getBalance()
    func debit(amount: Double)
    func credit(amount: Double)
    func describeAccount()
}