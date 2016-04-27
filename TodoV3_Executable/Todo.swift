//
//  Todo.swift
//  TodoV3_Executable
//
//  Created by Chidi Emeh on 4/26/16.
//  Copyright © 2016 Chidi Emeh. All rights reserved.
//

import Foundation

import Foundation

public class Todo :  CustomStringConvertible, Equatable{
    
    var title: String
    var body: String
    var id: Int
    public  var description: String {
        
        return "\(title)"
    }
    public  init(title: String, description: String, id: Int){
        self.title = title
        self.body = description
        self.id = id
    }
    
    public func details() -> String {
        return "Title: \(self.title)  Description: \(body)   ID: \(id)"
    }
    
    public func getTitle() -> String {
        return "\(self.title)"
    }
    public func getDescription() -> String {
        return "\(self.body)"
    }
    public func getID() -> Int{
        return self.id
    }
    
}

public func ==(lhs: Todo, rhs: Todo) -> Bool
{
    return (lhs.title == rhs.title) && (lhs.body == rhs.body) && (lhs.id == rhs.id)
}