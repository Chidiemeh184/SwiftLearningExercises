//
//  Container.swift
//  TodoV3_Executable
//
//  Created by Chidi Emeh on 4/26/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import Foundation

import Foundation

public class Container: CustomStringConvertible {
    var name: String
    
    var storage = Array<Todo>()
    
    public  var description: String {
        
        return "\(storage)"
    }
    
    public init(name: String){
        self.name = name
    }
    
    //Adds a Todo
    public func addTodo(item: Todo){
        storage.append(item)
    }
    
    //Deletes a Todo
    public func deleteTodo(item: Todo){
        if let toRemove = storage.indexOf(item){
            storage.removeAtIndex(toRemove)
        }
        else {
            print("Error! \(item) was not found!")
        }
    }
    
    //Replaces an old Todo with a new one
    public func updateTodo(old: Todo, new: Todo){
        self.deleteTodo(old)
        self.addTodo(new)
    }
    
    //Get returns a Todo or sets a new Todo at an index
    public subscript(index: Int) -> Todo {
        get{
            return storage[index]
        }
        
        set(newValue){
            self.storage[index] = newValue
        }
    }//End subscript
    
    //Get Todo by id
    public func getTodoByID(id: Int) -> Todo{
        
        var found: Todo?
        for item in self.storage {
            if item.getID() == id {
                found = item
            }
        }//end for                      //NEEDS ERROR CHECKING!!
        return found!                   //For wrong input
    }
    
    var debugDescription: String {
        return "\(storage)"
    }
    
    //Get all the Todo
    public func getAll() -> Array<Todo>{
        return storage
    }
    
    //Print all with the Index
    public func printAll() {
        for item in storage{
            print("Index: \(storage.indexOf(item)!)    " + item.details())
        }
    }
    
    //Remove At index
    public func removeAtIndex(index: Int){
        let del = self.storage[index]
        deleteTodo(del)
    }
    
}//End Container Class




