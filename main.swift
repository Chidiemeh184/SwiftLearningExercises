//==========================================================
//	NAME: CHIDI EMEH
//	COURSE: CSCI 2449 (iOS PROGRAMMING FUNDAMENTALS)
//	FILENAME: TodoV3_Executable
//	DATE:	4/26/2016
//	DESCRIPTION: ASSIGNMENT 3 (Command Line Executable)
//==========================================================

import Foundation

//Main Menu

func displayMenu(){
    //Displays Menu
    print("")
    print("        TodoList    Version 3.4.26.2016")
    print("")
    print("Welcome! Choose from the Menu")
    print("")
    print("1. Add a Todo")
    print("2. Delete a Todo")
    print("3. Update a Todo")
    print("4. List all Todos")
    print("5. List Todo of by ID")
    print("0. Exit")
    print("")
    print("Enter choice now: ")
    print("")
}


func createTodo(){
    //Creates a Todo
    print("Creating Todo")
    print("")
    print("Enter a Title")
    let title = readString()
    print("Enter a Description")
    let desc = readString()
    print("Enter the ID for \(title)")
    let id = readInt()
    print("")
    print("Todo has been created!")
    print("")
    store.addTodo(Todo(title: title, description: desc, id: id))
    print(store)
}

func listAllTask(){
    //List All Todos
    store.printAll()
}

func deleteTodo(){
    //Deletes a Todo at index
    print("Enter the index to delete")
    let del = readInt()
    store.removeAtIndex(del)
    print("Todo has been deleted...")
    print(store)
}

func updateTodo(){
    //Updates a Todo
    print("Enter the index to Update")
    let update = readInt()
    store.removeAtIndex(update)
    print("")
    print("Enter the new Value: ")
    print("")
    print("Enter new Title")
    let title = readString()
    print("Enter new Description")
    let desc = readString()
    print("Enter new ID for \(title)")
    let id = readInt()
    print("")
    print("Todo has been Updated!")
    print("")
    store.addTodo(Todo(title: title, description: desc, id: id))
    print(store)
    
}

func listById(){
    print("Enter ID")
    let id = readInt()
    let found = store.getTodoByID(id)
    print("")
    print(found)
    //print(found.details)
}


//Creating a Container 
public var store = Container(name: "Store")
displayMenu()
var input = readInt()

repeat{
    switch input{
    case 1:
         createTodo()
    case 2:
         deleteTodo()
    case 3:
         updateTodo()
    case 4:
       listAllTask()
    case 5:
       listById()
    default:
        print("You entered a zero")
    }
    displayMenu()
    input = readInt()
} while input != 0


















