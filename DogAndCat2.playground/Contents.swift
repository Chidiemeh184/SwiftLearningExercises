//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: DogAndCat2.playground
//  DATE: 4/15/2016
//  EXERCISE 9: This program demonstrates creating classes
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
    
    internal unowned var owner: Owner
    
    init(breed: String, color:String, age:Int, name:String, owner: Owner){
        self.breed = breed
        self.color = color
        self.age = age
        self.name = name
        self.owner = owner
    }
    
    
    func displayOwner() -> String {
        
        return "\(self.name)'s owner is \(owner.name)"
    }
    
    convenience init(){
        let owner = Owner(name: "Mr Smith")
        self.init(breed: "pit", color: "white", age: 0 , name: "Gertrude", owner: owner)
        owner.addDog(self)
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
    
    internal weak var owner: Owner?
    
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
    
    
    func displayOwner() -> String {
        
        if let theOwner = owner?.name {
            return "\(self.name)'s owner is \(theOwner)"
        }
        return " No owner"
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

class Owner: CustomDebugStringConvertible{
      var name: String
    
     var catList = Array<Cat>()
     var dogList = Array<Dog>()
    
    init(name: String){
        self.name = name
    }
    
    func addCat(cat: Cat){
        catList.append(cat)
        cat.owner = self
    }
    
    func removeCat(cat: Cat) {
        
        let toRemove = catList.indexOf { (cat) -> Bool in
            return true
        }
        catList.removeAtIndex(toRemove!)
    }
    
    func addDog(dog: Dog){
        dogList.append(dog)
       
    }
    
    
    func showCats() -> String {
        var list = ""
        
        for cats: Cat in catList {
            
            list = list + cats.name + ", "
        }
        return "\(list)"
    }
    
    func showDogs() -> String {
        var list = ""
        
        for dogs: Dog in dogList {
            
            list = list + dogs.name + ", "
        }
        return "\(list)"
    }
    
    subscript(index: Int, type: String) -> (Dog?, Cat?)?{
        get{
            switch type {
                
                case "cat":
                    guard index >= 0 && index < catList.count else { return nil }
                    
                    return (dog: nil, cat: catList[index])
                
                case "dog":
                    guard index >= 0 && index < dogList.count else { return nil }
                    
                    return (dog: dogList[index], cat: nil)
            default:
                return (dog: nil, cat: nil)
            }
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



james.addDog(dog1)
james.addCat(cat1)

sue.addDog(dog2)
sue.addCat(cat2)
sue.addCat(cat1)

cat2.displayOwner()
dog1.displayOwner()


james.showCats()
sue.showCats()


if let dog = james[0, "dog"]?.0 {
    
    print("\(dog.name)")
}

if let cat = james[0, "cat"]?.1 {
    
    print("\(cat.name)")
}







