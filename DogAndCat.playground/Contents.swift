//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: DogAndCat.playground
//  DATE: 4/15/2016
//  EXERCISE 8: This program demonstrates creating classes
//              and its properties and methods
//=============================================================

import UIKit


class Dog: CustomDebugStringConvertible, Hashable {
    
    var breed: String!
    var color: String!
    var age: Int!
    var name: String!
    
    //Property Observers
    var growingHeight: Int = 0 {
        willSet{
            print("\(name)'s new height is \(newValue)ft")
        }
        
        didSet{
            print("\(name)'s old height was \(oldValue)ft")
        }
    }
    
    var hashValue: Int {
        return "\(breed), \(color), \(age), \(name)".hashValue
    }
    
    init(breed: String, color:String, age:Int, name:String){
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
    
    convenience init(){
        self.init(breed: "pit", color: "white", age: 0 , name: "Gertrude")
    }
    
    //Read only computed Properties
    var getName: String {
        return self.name
    }
    var getBreed: String {
        return self.breed
    }
    var getColor: String {
        return self.color
    }
    var getAge: Int {
        return self.age
    }
    
    //Methods
    func barking(barkingSound sound: String) -> String {
        return "\(self.name): BARKING!! (\(sound))"
    }
    
    func eating(food food: String) -> String {
        return "\(self.name): ... eating (\(food))"
    }
    
    func sleeping(sleepingWhere sleepingWhere: String) -> String {
        return "\(self.name): ... sleeping on (\(sleepingWhere))"
    }
    
    func playing( with with: String) -> String{
        return "\(self.name): ... playing with (\(with))"
    }
    
    func chase(what what: String) -> String {
        return "\(self.name): ... chasing a (\(what))"
    }
    
    deinit{
        print("\(self.name) has been removed from memory")
    }
    
    
    var debugDescription: String {
        return " \(self.name)"
    }
}


class Cat: CustomDebugStringConvertible, Hashable{
    
    var breed: String!
    var color: String!
    var age: Int!
    var name: String
    
    //Property Observers
    var growingHeight: Int = 0 {
        willSet{
            print("\(name)'s new height is \(newValue)ft")
        }
        
        didSet{
            print("\(name)'s old height was \(oldValue)ft")
        }
    }
    
    var hashValue: Int {
        return "\(breed), \(color), \(age), \(name)".hashValue
    }
    
    init(breed: String, color:String, age:Int, name:String){
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
    convenience init(){
        self.init(breed: "short", color: "", age: 0 , name: "Garfield")
    }
    
    var getName: String {
        return self.name
    }
    var getBreed: String {
        return self.breed
    }
    var getColor: String {
        return self.color
    }
    var getAge: Int {
        return self.age
    }
    
    
    func meow() -> String {
        return "\(self.name): Meowing!"
    }
    
    func eating(food food: String) -> String {
        return "\(self.name): ... eating (\(food))"
    }
    
    func sleeping(sleepingWhere sleepingWhere: String) -> String {
        return "\(self.name): ... sleeping on (\(sleepingWhere))"
    }
    
    func playing( with with: String) -> String{
        return "\(self.name): ... playing with (\(with))"
    }
    
    func chase(what what: String) -> String {
        return "\(self.name): ... chasing a (\(what))"
    }
    
    deinit{
        print("\(self.name) has been removed from memory")
    }
    
    var debugDescription: String {
        return " \(self.name)"
    }
    
}

func ==(lhs: Cat, rhs: Cat) -> Bool{
    return lhs.hashValue == rhs.hashValue
}
func ==(lhs: Dog, rhs: Dog) -> Bool{
    return lhs.hashValue == rhs.hashValue
}


//Creating Dog

var groot = Dog(breed: "bull", color: "brown", age: 3, name: "groot")

groot.growingHeight = 3
groot.playing(with: "biscuit bone")
groot.eating(food: "wafer")


//Creating Cat
var tom = Cat(breed: "cartoon", color: "Blue and white", age: 9, name: "Tom cat")

tom.growingHeight = 5
tom.chase(what: "Jerry the mouse")
tom.sleeping(sleepingWhere: "the counch")

tom = nil;





