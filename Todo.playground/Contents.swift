//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: Todo.playground
//  DATE: 2/16/2016
//  ASSIGNMENT 1: This is a simple todo list using tuples
//                as data structures.

import UIKit
import Foundation


// This is the parent to-do with all the information and decription.

var todoList =  (   (day: "Monday", date: "2/5/2016", time: 1200, title: "Run 100 Miles", description: (" Run to Upper Arlington", " Go to the park", " Stay there if warm")),
    (day: "Tuesday", date: "2/6/2016", time: 1800, title: "Go to the Bar", description: ("Work on apps", " Think on app ideas for iphone and android ")),
    (day: "Wednesday", date: "2/7/2016", time: 1800, title: "Go to ios class", description:(" Do some reading and go to class")),
    (day: "Wednesday", date: "2/7/2016", time: 2100, title: "Go to bar after ios class", description:(" Do some reading", " Think on more app ideas", "Head home")))




//Printing all the todos (small description)

let mirror = Mirror(reflecting: todoList)
print(todoList.0.title, terminator: "")

for (index, singleTodoLists) in mirror.children{
    print(index!, singleTodoLists)
}

todoList.2.date = "3/7/2016"
todoList.0.description

//Printing all the todo List
let recordsMirror2 = Mirror(reflecting: todoList)
for case let (label?, record) in recordsMirror2.children {
    
    print(label)
    let recordMirror2 = Mirror(reflecting: record)
    for case let (label?, tuple) in recordMirror2.children {
        
        let tupleMirror2 = Mirror(reflecting: tuple)
        if tupleMirror2.children.count == 1 {
            
            for case let (label?, value) in tupleMirror2.children {
                
                let childs = Mirror(reflecting: value)
                
                for case let(first?, second) in childs.children{
                    print(second)
                }

            }
        } else {
            print("\t\(tuple)")
        }
    }
}


//print a single todo
print("")
print(todoList.2)


//Add a todo
var newTodo = (day: "Saturday", date: "2/20/2016", time: 1300, title: "Write some iOS Apps", description:(" Write two apps with reference from the internet", "Publish the app to app store"))

var newTodoList = (todoList, newTodo)

//Printing new todolist
let recordsMirror3 = Mirror(reflecting: newTodoList)
for case let (label?, record) in recordsMirror3.children {
    
    print(label)
    let recordMirror3 = Mirror(reflecting: record)
    for case let (label?, tuple) in recordMirror3.children {
        
        let tupleMirror3 = Mirror(reflecting: tuple)
        if tupleMirror3.children.count == 1 {
            
            for case let (label?, value) in tupleMirror3.children {
                
                let childs = Mirror(reflecting: value)
                
                for case let(first?, second) in childs.children{
                    print(second)
                }
                
            }
        } else {
            print("\t\(tuple)")
        }
    }
}


//Update a todo: Updating the first todo's title and description
todoList.0.title = "Run 5 miles"
todoList.0.description.0 = "Run to Downtown"
todoList.0.description.1 = "branch to Wendys"
todoList.0.description.2 = "Order cheeseburger and fries"


//Printing new todolist
print("")
print(todoList.0)

//Delete a todo
//OBSERVATION:
//This is possible and can be done, but it will take more resources beyond the level 
// of this course to accomplish. It can be done easily with array, dictionary or set.
/// Tuples is a simple data structure for temporary use.
// The API Advices
//
//
//Tuples are useful for temporary groups of related values. They are not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple

