//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: Inheritance.playground
//  DATE: 4/15/2016
//  EXERCISE 10: This program demonstrates creating classes
//              with its properties as well as inheritance
//=============================================================


import UIKit

class Domestic {
    
    var breed: String
    var color: String
    var age: Int
    var name: String
    
    // Initializer
    init(breed: String, color:String, age:Int, name:String){
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
    }
    
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
    
    func makeSound(sound: String) -> String {
        return "sound unknown"
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
    
    
}

class Dog: Domestic, CustomDebugStringConvertible, Hashable {

    internal unowned var owner: Owner
    
    init(breed: String, color:String, age:Int, name:String, owner: Owner){
        
        self.owner = owner
        super.init(breed: breed, color: color, age: age, name: name)
        owner.add(self)
    }
    
    func displayOwner() -> String {
        
        return "\(self.name)'s owner is \(owner.name)"
    }
    
    
    //Override
    override func makeSound(sound: String) -> String {
        return "\(self.name): BARKING!! (\(sound))"
    }

    
    deinit{
        print("\(self.name) has been removed from memory")
    }
    
    var debugDescription: String {
        return " \(self.name)"
    }
}


class Cat: Domestic, CustomDebugStringConvertible, Hashable{

    
    internal weak var owner: Owner?
    
    override init(breed: String, color:String, age:Int, name:String){
        super.init(breed: breed, color: color, age: age, name: name)
    }
    
    convenience init(){
        self.init(breed: "short", color: "", age: 0 , name: "Garfield")
    }
    
    
    func displayOwner() -> String {
        
        if let theOwner = owner?.name {
            return "\(self.name)'s owner is \(theOwner)"
        }
        return " No owner"
    }
    
    override func makeSound(sound: String) -> String {
        return "\(self.name): is making sound (\(sound))"
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

class Owner: CustomDebugStringConvertible{
    var name: String
    
    
    init(name: String){
        self.name = name
    }

    //Collection of Pets
    var pets = Array<Domestic>()
    
    
    //Add Pets
    func add(pet: Domestic){
        pets.append(pet)
    }
    
    //Remove Pets
    func remove(pet: Domestic){
        let toRemove = pets.indexOf { (pet) -> Bool in
            return true
        }
        pets.removeAtIndex(toRemove!)
    }
    
    //Show pets
    
    func showPets() -> String {
        var list = ""
        
        for pet: Domestic in pets {
            
            list = list + pet.name + ", "
        }
        return "\(list)"
    }
    
    subscript(index: Int) -> (Domestic)?{
        get{

                guard index >= 0 && index < pets.count else { return nil }
                
                return  pets[index]

            }
    
    }
    
    
    var debugDescription: String {
        return " \(self.name)"
    }
    
}

var james = Owner(name: "Mr James")
var sue = Owner(name: "Mrs Sue")

var dog1 = Dog(breed: "bulldog", color: "white", age: 2, name: "Billy", owner: james)
var dog2 = Dog(breed: "German Shepard", color: "Brown-black", age: 3, name: "Pongo", owner: james)


var cat1 = Cat(breed: "Skinny", color: "white", age: 2, name: "Felix")
var cat2 = Cat(breed: "big", color: "Orange and White", age: 1, name: "Garfield")

james.add(cat1)
james.add(cat2)


james[3]

james.showPets()






