//=============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: StudentsInMyClass.playground
//  DATE: 2/16/2016
//  EXERCISE 2: This program shows basic string manipulation
//              and the use of ranges
//=============================================================

/*:
**Exercise:** Get Acquainted. Get a few properties of each student in your class... name and email are good. Use the `String` and `Character` as well as the data types and operators in [Basics | Data Types | Operators](Basics%20|%20Data%20Types%20|%20Operators) to complete this exercise.
>> **Example Output:**
* `My name is Mathew Sheets, my email is swift.dude@gmail.com.`
* `Other students in my class are Annie, Sam, Jack, Hudson and Oliver.`
* `Oliver dropped this class.` (**use the second bullet point string to pull out the last students's name.**)
* `Other students in my class are Annie, Sam, Jack, Hudson and CARSON was added.`  (**use the second bullet point string and append another student.**)
* `Jack and Hudson are in the class.` (**use the second bullet point string to pull out third and fourth student.**)
>> **Constraints:**
* Use a nested tuple to hold your students
* Use the string created from the second bullet point for all other string creation
*/

import UIKit
import Foundation

let iosClassMates = (
    (firstName: "Chidi", lastName: "Emeh", email: "chidiemeh184@gmail.com" ),
    (firstName: "Peter", lastName: "Carswell", email: "pcarswell@cscc.edu" ),
    (firstName: "Jeffrey", lastName: "Mink", email: "jmink@cscc.edu" ),
    (firstName: "Duane", lastName: "Soisson", email: "doission@cscc.edu" ),
    (firstName: "Jorge", lastName: "Vallejos", email: "jvallejos@cscc.edu" ),
    (firstName: "Max", lastName: "Payne", email: "mpayne@cscc.edu" )
)

let iosClassMatesNewStudentAdded = (firstName: "Carson", lastName: "Payne", email: "cpayne@cscc.edu" )

let me = "My name is \(iosClassMates.0.firstName) \(iosClassMates.0.lastName), my email is \(iosClassMates.0.email)."

// The Second String
var otherStudents = "Other students in my class are \(iosClassMates.1.firstName), \(iosClassMates.2.firstName), \(iosClassMates.3.firstName), \(iosClassMates.4.firstName) and \(iosClassMates.5.firstName)."

// The Third String
let lastStudent = otherStudents.substringWithRange(otherStudents.endIndex.advancedBy(-4)..<otherStudents.endIndex.advancedBy(-1))

//The Fourth String
var otherStudentsNew = otherStudents


let range = otherStudents.endIndex.advancedBy(-4)..<otherStudents.endIndex.advancedBy(-0)
otherStudentsNew.replaceRange(range, with: "\(iosClassMatesNewStudentAdded.firstName.uppercaseString) was added.")

// The 3rd Student
let thirdStudent = otherStudents.substringWithRange(otherStudents.startIndex.advancedBy(47)..<otherStudents.endIndex.advancedBy(-16))

//The 4th Student
let fourthStudent = otherStudents.substringWithRange(otherStudents.startIndex.advancedBy(54)..<otherStudents.endIndex.advancedBy(-8))




//Expected output
print(me)
print(otherStudents)
print("\(lastStudent) dropped this class.")
print(String(otherStudentsNew))
print("\(thirdStudent) and \(fourthStudent)are in the class.")


