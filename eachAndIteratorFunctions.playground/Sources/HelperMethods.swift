import Foundation

public typealias Student = [String:String]

//This function accepts two argumenst: an array and a closure that returns void
//The closure provides the index for which the iteration can occur
func iterator(students: [Student], closure: (student: Student) -> Void) {
    
    for var index = 0; index < students.count; ++index {
        
        closure(student: students[index])
    }
}


//This function accepts two parameters: An array of Students and a closure
//that accept a student type and an index for a location in the given array
// Using the iterator function. This method iterates through each member elements 
//in the given array beginning from the first and increasing. The closure 
//returns a void
public func each(students: [Student], closure: (student: Student, index: Int) -> Void) {
    
    var index = 0;
    
    iterator(students) { closure(student: $0, index: index++) }
}

// This function check to see if all the array 
//elements are present
// Returns true if all of the elements is not false
public func all(students: [Student], closure: (student: Student) -> Bool) -> Bool {
    
    var all = true
    
    iterator(students) { (student) -> Void in
        
        if all && !closure(student: student) {
            
            all = false
        }
    }
    
    return all
}

// Returns true if at least one of the elements is not false
public func any(students: [Student], closure: (student: Student) -> Bool) -> Bool {
    
    var any = false
    
    iterator(students) { (student) -> Void in
        
        if !any && closure(student: student) {
            
            any = true
        }
    }
    
    return any
}

//For a given array, this function serches for the position
//of a particular element in the array, being the index
// Returns the index at which element can be found
public func indexOf(students: [Student], closure: (student: Student) -> Bool) -> Int? {
    
    var index = -1
    var found = false
    
    iterator(students) { (student) -> Void in
        
        if !found {
            
            if closure(student: student)  {
                found = true
            }
            
            index++
        }
    }
    
    return index == -1 || !found ? nil : index
}

// Returns true if the element is present
public func contains(students: [Student], closure: (student: Student) -> Bool) -> Bool {
    
    var found = false
    
    iterator(students) { (student) -> Void in
        
        if !found && closure(student: student) {
            
            found = true
        }
    }
    
    return found
}

// Returns an array of all the elements that pass a truth test
public func filter(students: [Student], closure: (student: Student) -> Bool) -> [Student]? {
    
    var filter = [Student]()
    
    iterator(students) { (student) -> Void in
        
        if closure(student: student) {
            
            filter.append(student)
        }
    }
    
    return !filter.isEmpty ? filter : nil
}

// Returns the elements in the array without the elements that pass a truth test
public func reject(students: [Student], closure: (student: Student) -> Bool) -> [Student]? {
    
    var keep = [Student]()
    
    iterator(students) { (student) -> Void in
        
        if !closure(student: student) {
            
            keep.append(student)
        }
    }
    
    return !keep.isEmpty ? keep : nil
}

// Returns an array of a specific value from all the elements
public func pluck(students: [Student], closure: (student: Student) -> String) -> [String] {
    
    var plucked = [String]()
    
    iterator(students) { plucked.append(closure(student: $0)) }
    
    return plucked
}