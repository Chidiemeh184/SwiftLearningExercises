//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: TodoV2.playground
//  DATE: 03/13/2016
//  ASSIGNMENT 2: This is a simple todo list using tuples
//                as data structures.

import UIKit
import Foundation




//Holds all the todos
var todoList = [
                    ["date":"Monday", "title":"Run 100 Miles", "description":"Run 100 Miles"],
                    ["date":"2/7/2016", "title":"Work on apps", "description":"Work on apps and ideas"],
                    ["date":"2/8/2016", "title": "Go to class", "description":"Think more on apps ideas"]
    
                ]

todoList[0]

//Get all the Todo
func printTodos(todo:[[String:String]]) -> Void {
    for var i = 0; i < todo.count; ++i{
       print("Index: \(i)  \(todo[i])")
    }
}

//Get a todo by id
func getTodoById(todo:[[String:String]], index:Int) -> [String:String] {
    //print("Index: \(index + 1)",todo[index])
    return todo[index]
}

//Add a tod0
func addTodo(var todo:[[String:String]], newTodo:[String:String]) -> [[String:String]]{
    todo.append(newTodo)
    return todo
}



//Update a todo
func updateTodoById(var todo:[[String:String]], index:Int, key: String, newValue: String) ->[[String:String]] {
    var toUpdate = getTodoById(todo, index: index)
    toUpdate[key] = newValue
    todo.append(toUpdate)
    return todo
}

//delete a todo
func deleteTodoById(todo:[[String:String]], index:Int) -> Void {
    print("Index: \(index + 1)",todo[index])
    
}


//Testing the Functions

//Print all Todos
print(printTodos(todoList))

//Getting a todo at index 1
print(getTodoById(todoList, index: 1))


//Adding a todo
var gym = ["date":"Saturday", "title":"Go to the gym", "description":"Work on chest and leg"]
print(addTodo(todoList, newTodo: gym))


//Update a Todo
updateTodoById(todoList, index: 0, key: "description", newValue: "Run 1 mile, 100 will be too much")

//Delete a todo
deleteTodoById(todoList, index: 0)







