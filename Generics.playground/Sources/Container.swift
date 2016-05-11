import Foundation

// the contract for the Container
public protocol Container {
    
    typealias ItemType
    
    func addItem(item: ItemType)
    
    func removeItem(item: ItemType) -> ItemType?
    
    var count: Int { get }
    
    subscript(i: Int) -> ItemType { get }
}

// the class that can hold any data type but the element must be equatable
public class Database<Element where Element: Equatable, Element: Hashable> {
    
    public var items: [Element]
    
    public init() {
        
        items = [Element]()
    }
}

extension Database: Container {
    
    public typealias ItemType = Element
    
    //adds to the main storage
    public func addItem(item: ItemType) {
        items.append(item)
    }
    
    //Removes from the main storage
    public func removeItem(item: ItemType) -> ItemType? {
        let index = items.indexOf { $0 == item }
        if index != nil {
            return items.removeAtIndex(index!)
        }
        return nil
    }
    
    public var count: Int {
        return items.count
    }
    
    public subscript(i: Int) -> ItemType {
        return items[i]
    }
}

//To Iterate throught the elements
public class DataFinder {
    
    public init() {
        
    }
    
    //goes throught each element
    func iterator<T>(items: [T], closure: (item: T) -> Void) {
        
        for index in 0..<items.count {
            
            closure(item: items[index])
        }
    }
    
    //Goes through each element
    public func each<T>(items: [T], closure: (item: T, index: Int) -> Void) {
        
        var index = 0;
        
        iterator(items) { (item) in
            
            closure(item: item, index: index)
            
            index += 1
        }
    }
    
    //Checks if all the elements of type T are in list then returns a boolean
    public func all<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var all = true
        
        iterator(items) { (item) -> Void in
            
            if all && !closure(item: item) {
                
                all = false
            }
        }
        
        return all
    }
    
    //Checks if any of the element of type T in list then returns a boolean
    public func any<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var any = false
        
        iterator(items) { (item) -> Void in
            
            if !any && closure(item: item) {
                
                any = true
            }
        }
        
        return any
    }
    
    //Finds the index of an Element and returns an Integer of the position
    public func indexOf<T>(items: [T], closure: (item: T) -> Bool) -> Int? {
        
        var index = -1
        var found = false
        
        iterator(items) { (item) -> Void in
            
            if !found {
                
                if closure(item: item)  {
                    found = true
                }
                
                index += 1
            }
        }
        
        return index == -1 || !found ? nil : index
    }
    
    //Check if list has the element then returns a boolean
    public func contains<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var found = false
        
        iterator(items) { (item) -> Void in
            
            if !found && closure(item: item) {
                
                found = true
            }
        }
        
        return found
    }
    
    //Returns a list of filtered elements
    public func filter<T>(items: [T], closure: (item: T) -> Bool) -> [T]? {
        
        var filter = [T]()
        
        iterator(items) { (item) -> Void in
            
            if closure(item: item) {
                
                filter.append(item)
            }
        }
        
        return !filter.isEmpty ? filter : nil
    }
    
    //Returns a list without rejected elements
    public func reject<T>(items: [T], closure: (item: T) -> Bool) -> [T]? {
        
        var keep = [T]()
        
        iterator(items) { (item) -> Void in
            
            if !closure(item: item) {
                
                keep.append(item)
            }
        }
        
        return !keep.isEmpty ? keep : nil
    }
    
    
    //gets an element of AnyObject type
    public func pluck<T>(items: [T], closure: (item: T) -> AnyObject) -> [AnyObject] {
        
        var plucked = [AnyObject]()
        
        iterator(items) { plucked.append(closure(item: $0)) }
        
        return plucked
    }
}

