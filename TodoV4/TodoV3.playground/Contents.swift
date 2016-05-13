//==========================================================
//	NAME: CHIDI EMEH
//	COURSE: CSCI 2449 (iOS PROGRAMMING FUNDAMENTALS)
//	FILENAME: TodoV3
//	DATE:	4/26/2016
//	DESCRIPTION: ASSIGNMENT 3
//==========================================================
import UIKit


var mainBucket = Container(name: "mainBucket")

var walk = Todo(title: "Walk", description: "walking", id: 2)
var run = Todo(title: "Run", description: "Running", id: 3)
var sit = Todo(title: "Sit", description: "Sitting", id: 4)
var stand = Todo(title: "Stand", description: "Standing", id: 1)

//Adding A Todo
mainBucket.addTodo(walk)
mainBucket.addTodo(run)
mainBucket.addTodo(sit)
mainBucket.addTodo(stand)

//Get all Todo
var allInMainBucket = mainBucket.getAll()
for item in allInMainBucket {
    print(item.details())
}

//Update a Todo
print("")
print("Before Update")
print(mainBucket)
print("")
print("After Update")
var walking = Todo(title: "walking", description: "Walking in the park", id: 2)
mainBucket.updateTodo(walk, new: walking)
print(mainBucket)


//Delete a Todo
print("")
print("Before Deleting")
print(mainBucket)
print("")
print("After Deleting")
mainBucket.deleteTodo(sit)
print(mainBucket)

//Get Todo by ID
mainBucket.getTodoByID(2)

mainBucket.printAll()

mainBucket.removeAtIndex(2)
print("")
mainBucket.printAll()


