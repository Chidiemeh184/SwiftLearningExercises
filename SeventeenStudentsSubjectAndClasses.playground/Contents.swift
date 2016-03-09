//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: SeventeenStudentsSubjectAndClasses.playground
//  DATE: 2/20/2016
//  EXERCISE 4: This program demonstrate the use of arrays
//              sets and dictionnaries in swift
//=============================================================

/*:
**Exercise:** You have to record all the students for your school. Leveraging arrays, dictionaries, and sets, create table like containers for each class. Your classes are Math, Science, English and History with a total of 17 unique students with 7 students in each class. Print out each class roster and experiment with set operations, membership and equality.
>> **Example Output:**
* `Math = Mathew Sheets, John Winters, Sam Smith`
* `Science = Sam Smith, Carson Daily, Adam Aarons`
* `Union of Math and Science = Mathew Sheets, John Winters, Sam Smith, Carson Daily, Adam Aarons`
>> **Constraints:**
* Use Set Operations
* intersect
* exclusiveOr
* union
* subtract
* Use Set Membership and Equality
* is equal
* isSubsetOf
* isSupersetOf
* isStrictSubsetOf
* isStrictSupersetOf
* isDisjointWith
*/

import Foundation

//This is the list of all the students
let listOfAllStudents = ["Olivia Hudson",
                      "Bernadette Wilson",
                      "Wendy Brown",
                      "Alexandra Sharp",
                      "Adam Carr",
                      "Frank Vance",
                      "Julia Reid",
                      "Alan Duncan",
                      "Victor Black",
                      "Audrey Russell",
                      "Diane Harris",
                      "Dylan Dickens",
                      "Ruth Hill",
                      "Faith Lawrence",
                      "Adrian Vaughan",
                      "Joseph Mackay",
                      "Piers King"
                    ]


//The classes
//I used set to avoid duplicates

let allTheStudents = Set(listOfAllStudents)
var mathStudents = Set<String>()
var scienceStudents = Set<String>()
var englishStudents = Set<String>()
var historyStudents = Set<String>()

//The Students taking Math
mathStudents.insert(listOfAllStudents[0])
mathStudents.insert(listOfAllStudents[1])
mathStudents.insert(listOfAllStudents[14])
mathStudents.insert(listOfAllStudents[3])
mathStudents.insert(listOfAllStudents[11])
mathStudents.insert(listOfAllStudents[5])
mathStudents.insert(listOfAllStudents[8])


//The Students taking Science
scienceStudents.insert(listOfAllStudents[7])
scienceStudents.insert(listOfAllStudents[8])
scienceStudents.insert(listOfAllStudents[9])
scienceStudents.insert(listOfAllStudents[13])
scienceStudents.insert(listOfAllStudents[1])
scienceStudents.insert(listOfAllStudents[12])
scienceStudents.insert(listOfAllStudents[3])



//The Students taking English
englishStudents.insert(listOfAllStudents[16])
englishStudents.insert(listOfAllStudents[2])
englishStudents.insert(listOfAllStudents[7])
englishStudents.insert(listOfAllStudents[11])
englishStudents.insert(listOfAllStudents[8])
englishStudents.insert(listOfAllStudents[3])
englishStudents.insert(listOfAllStudents[5])


//The students taking History
historyStudents.insert(listOfAllStudents[1])
historyStudents.insert(listOfAllStudents[4])
historyStudents.insert(listOfAllStudents[15])
historyStudents.insert(listOfAllStudents[6])
historyStudents.insert(listOfAllStudents[3])
historyStudents.insert(listOfAllStudents[0])
historyStudents.insert(listOfAllStudents[5])


//The students in Math and Science Class
var mathAndScienceStudents = mathStudents.union(scienceStudents)
print(mathStudents)
print(scienceStudents)
print(mathAndScienceStudents)


//The Math Students taking History Class
var mathStudentTakingHistory = mathStudents.intersect(historyStudents)


//Intersect
var takingAllFourClasses = allTheStudents.intersect(mathStudents).intersect(scienceStudents).intersect(englishStudents).intersect(historyStudents)

//ExclusiveOr
var mathAndEnglish = mathStudents.intersect(englishStudents)
var justMathAndEnglishStudents = mathStudents.exclusiveOr(englishStudents)
var justHistoryAndScience = historyStudents.exclusiveOr(scienceStudents)


//Subtract
var historyAndEnglishStudents = allTheStudents.subtract(mathAndScienceStudents)


//Set Equality
mathStudents.isSubsetOf(allTheStudents)
allTheStudents.isSupersetOf(mathAndScienceStudents)
historyAndEnglishStudents.isDisjointWith(mathAndScienceStudents)
takingAllFourClasses.isStrictSubsetOf(mathStudents)
mathStudents.isSupersetOf(justMathAndEnglishStudents)


//Expected output

//Printing The Math Students
var temp: String = " "
for eachStudent in mathStudents{
   temp = temp + eachStudent + ", "
}
var end = temp.substringToIndex(temp.endIndex.advancedBy(-2)) + "."
print("Math = \(end)")


//Printing the Science Students
var temp2: String = " "
for eachStudent in scienceStudents{
    temp2 = temp2 + eachStudent + ", "
}
var end2 = temp2.substringToIndex(temp2.endIndex.advancedBy(-2)) + "."
print("Science = \(end2)")


//Printing the Union of Math and Science
var temp3: String = " "
for eachStudent in mathAndScienceStudents{
    temp3 = temp3 + eachStudent + ", "
}
var end3 = temp3.substringToIndex(temp3.endIndex.advancedBy(-2)) + "."
print("Math and Science: \(end3)")




