import Foundation

public class DataFinder {
    
    public init() {
        
    }
    
    public func iterator<T>(items: [T], closure: (item: T) -> Void) {
        
        for index in 0..<items.count {
            
            closure(item: items[index])
        }
    }
    
    public func each<T>(items: [T], closure: (item: T, index: Int) -> Void) {
        
        var index = 0;
        
        iterator(items) { (item) in
            
            closure(item: item, index: index)
            
            index += 1
        }
    }
    
    public func all<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var all = true
        
        iterator(items) { (item) -> Void in
            
            if all && !closure(item: item) {
                
                all = false
            }
        }
        
        return all
    }
    
    public func any<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var any = false
        
        iterator(items) { (item) -> Void in
            
            if !any && closure(item: item) {
                
                any = true
            }
        }
        
        return any
    }
    
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
    
    public func contains<T>(items: [T], closure: (item: T) -> Bool) -> Bool {
        
        var found = false
        
        iterator(items) { (item) -> Void in
            
            if !found && closure(item: item) {
                
                found = true
            }
        }
        
        return found
    }
    
    public func filter<T>(items: [T], closure: (item: T) -> Bool) -> [T]? {
        
        var filter = [T]()
        
        iterator(items) { (item) -> Void in
            
            if closure(item: item) {
                
                filter.append(item)
            }
        }
        
        return !filter.isEmpty ? filter : nil
    }
    
    public func reject<T>(items: [T], closure: (item: T) -> Bool) -> [T]? {
        
        var keep = [T]()
        
        iterator(items) { (item) -> Void in
            
            if !closure(item: item) {
                
                keep.append(item)
            }
        }
        
        return !keep.isEmpty ? keep : nil
    }
    
    public func pluck<T>(items: [T], closure: (item: T) -> AnyObject) -> [AnyObject] {
        
        var plucked = [AnyObject]()
        
        iterator(items) { plucked.append(closure(item: $0)) }
        
        return plucked
    }
}

