import Foundation

//Person class
public class Person {
    
    public var first: String
    public var last: String
    
    public init(first: String, last: String){
        self.first = first
        self.last = last
    }
}

//To string representation
public func ==(lhs: Person, rhs: Person) -> Bool {
    
    return lhs.first == rhs.first && lhs.last == rhs.last
}

//Conforms to Equatable
extension Person: Equatable {}

//Conforms to Hasable
extension Person: Hashable {
    
    public var hashValue: Int {
        
        return "\(first)\(last)".hashValue
    }
}

