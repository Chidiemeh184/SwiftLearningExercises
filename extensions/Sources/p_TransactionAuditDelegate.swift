import Foundation

public protocol TransactionAuditDelegate {
    func willPerform() -> String
    func performing() -> String
    func didPerform() -> String
    func generateMiniReport()
}

