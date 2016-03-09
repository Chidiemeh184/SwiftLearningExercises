//============================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: iPhoneEnumeration.playground
//  DATE: 3/08/2016
//  EXERCISE 7: This program demonstrates the use of enum as
//              functions, parameter types and switch case
//              in swift.
//=============================================================

/*:
**Exercise:** We need to model the set of possible iPhones manufactured. Replace each possible tuple property value with an enumeration that would be appropriate to the current non enumeration value.
*/
//let iPhone          = (modelName: "iPhone", modelNumbers: ["A1203"], hardwareStrings: ["iPhone1,1"], osVersions: [1, 2, 3])
//let iPhone3G        = (modelName: "iPhone 3G", modelNumbers: ["A1324", "A1241"], hardwareStrings: ["iPhone1,2"], osVersions: [2, 3, 4])
//let iPhone3Gs       = (modelName: "iPhone 3Gs", modelNumbers: ["A1325", "A1303"], hardwareStrings: ["iPhone2,1"], osVersions: [3, 4, 5, 6])
//let iPhone4         = (modelName: "iPhone 4", modelNumbers: ["A1349", "A1332"], hardwareStrings: ["iPhone3,1", "iPhone3,2", "iPhone3,3"], osVersions: [4, 5, 6, 7])
//let iPhone4s        = (modelName: "iPhone 4S", modelNumbers: ["A1431", "A1387"], hardwareStrings: ["iPhone4,1"], osVersions: [5, 6, 7, 8, 9])
//let iPhone5         = (modelName: "iPhone 5", modelNumbers: ["A1428", "A1429", "A1442"], hardwareStrings: ["iPhone5,1", "iPhone5,2"], osVersions: [6, 7, 8, 9])
//let iPhone5c        = (modelName: "iPhone 5c", modelNumbers: ["A1532", "A1456", "A1507", "A1529"], hardwareStrings: ["iPhone5,3", "iPhone5,4"], osVersions: [7, 8, 9])
//let iPhone5s        = (modelName: "iPhone 5s", modelNumbers: ["A1533", "A1453", "A1457", "A1530"], hardwareStrings: ["iPhone6,1", "iPhone6,2"], osVersions: [7, 8, 9])
//let iPhone6         = (modelName: "iPhone 6", modelNumbers: ["A1549", "A1586"], hardwareStrings: ["iPhone7,2"], osVersions: [8, 9])
//let iPhone6Plus     = (modelName: "iPhone 6 Plus", modelNumbers: ["A1522", "A1524"], hardwareStrings: ["iPhone7,1"], osVersions: [8, 9])
//let iPhone6s        = (modelName: "iPhone 6s", modelNumbers: ["A1633", "A1688"], hardwareStrings: ["iPhone8,1"], osVersions: [9])
//let iPhone6sPlus    = (modelName: "iPhone 6s Plus", modelNumbers: ["A1634", "A1687"], hardwareStrings: ["iPhone8,2"], osVersions: [9])
//
//let phones = [iPhone, iPhone3G, iPhone3Gs, iPhone4, iPhone4s, iPhone5, iPhone5c, iPhone5s, iPhone6, iPhone6Plus, iPhone6s, iPhone6sPlus]
/*:
>> **Constraints:**
* Create the following Enumerations:
* ModelName = Enumeration for all the modal names
* ModelNumber = Enumeration for all the modal numbers
* HardwareString = Enumeration for all hardware string
* OSVersion = Enumeration for all os versions
* Create the following Functions
* Create a device passing in as arguments each enumeration
* Validate the parameters using a guard statement
* Throw an error that's appropriate to the invalid parameter value
* Return a tuple similar to above only using the above enumerations
* Get Device with ModelName
* Get Device with ModelNumber
* Get Device with HardwareString
* Get Devices with OSVersion
*/


import UIKit
import Foundation

//Enumeration for ModelName
enum ModelName: String {
    case iPhone = "iPhone"
    case iPhone3G = "iPhone 3G"
    case iPhone3Gs = "iPhone 3Gs"
    case iPhone4 = "iPhone 4"
    case iPhone4s = "iPhone 4S"
    case iPhone5 = "iPhone 5"
    case iPhone5c = "iPhone 5c"
    case iPhone5s = "iPhone 5s"
    case iPhone6 = "iPhone 6"
    case iPhone6Plus = "iPhone 6 Plus"
    case iPhone6s = "iPhone 6s"
    case iPhone6sPlus = "iPhone 6s Plus"
}


//Enumeration for ModelNumber
enum ModelNumber: String {
    case A1203 = "A1203"
    case A1324 = "A1324"
    case A1241 = "A1241"
    case A1325 = "A1325"
    case A1303 = "A1303"
    case A1349 = "A1349"
    case A1332 = "A1332"
    case A1431 = "A1431"
    case A1387 = "A1387"
    case A1428 = "A1428"
    case A1429 = "A1429"
    case A1442 = "A1442"
    case A1532 = "A1532"
    case A1456 = "A1456"
    case A1507 = "A1507"
    case A1529 = "A1529"
    case A1533 = "A1533"
    case A1453 = "A1453"
    case A1457 = "A1457"
    case A1530 = "A1530"
    case A1549 = "A1549"
    case A1586 = "A1586"
    case A1522 = "A1522"
    case A1524 = "A1524"
    case A1633 = "A1633"
    case A1688 = "1688"
    case A1634 = "A1634"
    case A1687 = "A1687"
}

//Enumeration for all hardware string
enum HardwareString: String {
    case iPhone1_1 = "iPhone1,1"
    case iPhone1_2 = "iPhone1,2"
    case iPhone2_1 = "iPhone2,1"
    case iPhone3_1 = "iPhone3,1"
    case iPhone3_2 = "iPhone3,2"
    case iPhone3_3 = "iPhone3,3"
    case iPhone4_1 = "iPhone4,1"
    case iPhone5_1 = "iPhone5,1"
    case iPhone5_2 = "iPhone5,2"
    case iPhone5_3 = "iPhone5,3"
    case iPhone5_4 = "iPhone5,4"
    case iPhone6_1 = "iPhone6,1"
    case iPhone6_2 = "iPhone6,2"
    case iPhone7_2 = "iPhone7,2"
    case iPhone7_1 = "iPhone7,1"
    case iPhone8_1 = "iPhone8,1"
    case iPhone8_2 = "iPhone8,2"
}

//Enumeration for all os versions
enum OSVersion: Int {
    case os1 = 1, os2, os3, os4, os5, os6, os7, os8, os9
}

//Enumeration for the Errors
enum wrongArgumentError: ErrorType {
    case wrongModelNameError
    case wrongModelNumber
    case wrongHardwareString
    case wrongOSVersion 
}



//The Function to create device
// parameters:
// modelName of Enum type ModelName; modelNumbers of Enum type ModelNumber
// hardwareString of Enum type HardwareString and osVersion of Enum type OSVersion
// Returns a tuple with info where appropriate.
func createDevice(modelName: ModelName, modelNumber: ModelNumber, hardwareString: HardwareString, osVersion: OSVersion) throws ->
    (Name:String, Number:[String], Hardware:[String], Version:[Int]){


    do {
        
        //set the model name
        switch modelName {
        case .iPhone:break
        case .iPhone3G:break
        case .iPhone3Gs:break
        case .iPhone4:break
        case .iPhone4s:break
        case .iPhone5:break
        case .iPhone5c:break
        case .iPhone5s:break
        case .iPhone6:break
        case .iPhone6Plus:break
        case .iPhone6s:break
        case .iPhone6sPlus:break
        }
        
        //set the model number
        switch modelNumber {
        case .A1203:break
        case .A1324, .A1241: break
        case .A1325, .A1303: break
        case .A1349, .A1332: break
        case .A1431, .A1387: break
        case .A1428, .A1429, .A1442: break
        case .A1532, .A1456, .A1507, .A1529: break
        case .A1533, .A1453, .A1457, .A1530: break
        case .A1549, .A1586: break
        case .A1522, .A1524: break
        case .A1633, .A1688: break
        case .A1634, .A1687: break
        }
        
        //set the hardware string
        switch hardwareString {
        case .iPhone1_1 : break
        case .iPhone1_2 : break
        case .iPhone2_1 : break
        case .iPhone3_1 : break
        case .iPhone3_2 : break
        case .iPhone3_3 : break
        case .iPhone4_1 : break
        case .iPhone5_1 : break
        case .iPhone5_2 : break
        case .iPhone5_3 : break
        case .iPhone5_4 : break
        case .iPhone6_1 : break
        case .iPhone6_2 : break
        case .iPhone7_2 : break
        case .iPhone7_1 : break
        case .iPhone8_1 : break
        case .iPhone8_2 : break
        }
        
        //set the OS Version
        switch osVersion {
        case .os1: break
        case .os2: break
        case .os3: break
        case .os4: break
        case .os5: break
        case .os6: break
        case .os7: break
        case .os8: break
        case .os9: break
        }

        //creates constant for returns
        let model = modelName.rawValue
        let number = modelNumber.rawValue
        let hardware = hardwareString.rawValue
        let version = osVersion.rawValue
        
        // Return appropriate values
        return (model, [number], [hardware], [version])
        
    }
        
    //Catch Appropriate Errors
    //TODO: NEEDS TO CATCH AND THROW ERROR
    catch  wrongArgumentError.wrongModelNameError{
        print("Wrong model name")
    }
    catch wrongArgumentError.wrongModelNumber {
        print("Wrong model number")
    }
    catch wrongArgumentError.wrongHardwareString {
        print("Wrong hardware String")
    }
    catch wrongArgumentError.wrongOSVersion {
        print("Wrong OS Version")
    }
}


//Create the phone with createDevice method
let iPhone = try! (createDevice(ModelName.iPhone, modelNumber: ModelNumber.A1324, hardwareString: HardwareString.iPhone1_1, osVersion: OSVersion.os1))
let iPhone3G = try! (createDevice(ModelName.iPhone3G, modelNumber: ModelNumber.A1324, hardwareString: HardwareString.iPhone1_2, osVersion: OSVersion.os3))
let iPhone3Gs = try! (createDevice(ModelName.iPhone3Gs, modelNumber: ModelNumber.A1325, hardwareString: HardwareString.iPhone2_1, osVersion: OSVersion.os4))
let iPhone4 = try! (createDevice(ModelName.iPhone4, modelNumber: ModelNumber.A1349, hardwareString: HardwareString.iPhone3_2, osVersion: OSVersion.os5))
let iPhone4s = try! (createDevice(ModelName.iPhone4s, modelNumber: ModelNumber.A1431, hardwareString: HardwareString.iPhone4_1, osVersion: OSVersion.os6))
let iPhone5 = try! (createDevice(ModelName.iPhone5, modelNumber: ModelNumber.A1428, hardwareString: HardwareString.iPhone5_1, osVersion: OSVersion.os6))
let iPhone5c = try! (createDevice(ModelName.iPhone5c, modelNumber: ModelNumber.A1532, hardwareString: HardwareString.iPhone5_3, osVersion: OSVersion.os7))
let iPhone5s = try! (createDevice(ModelName.iPhone5s, modelNumber: ModelNumber.A1533, hardwareString: HardwareString.iPhone6_1, osVersion: OSVersion.os8))
let iPhone6 =  try! (createDevice(ModelName.iPhone6, modelNumber: ModelNumber.A1549, hardwareString: HardwareString.iPhone7_1, osVersion: OSVersion.os8))
let iPhone6Plus = try! (createDevice(ModelName.iPhone6Plus, modelNumber: ModelNumber.A1522, hardwareString: HardwareString.iPhone7_1, osVersion: OSVersion.os9))
let iPhone6s = try! (createDevice(ModelName.iPhone6s, modelNumber: ModelNumber.A1633, hardwareString: HardwareString.iPhone8_1, osVersion: OSVersion.os9))
let iPhone6sPlus =  try! (createDevice(ModelName.iPhone6sPlus, modelNumber: ModelNumber.A1687, hardwareString: HardwareString.iPhone8_2, osVersion: OSVersion.os9))

let phones = [iPhone, iPhone3G, iPhone3Gs, iPhone4, iPhone4s, iPhone5, iPhone5c, iPhone5s, iPhone6, iPhone6Plus, iPhone6s, iPhone6sPlus]


//Getter Functions

//Get Device with ModelName
func getDeviceWithModelName(modelName: ModelName) -> (Name:String, Number:[String], Hardware:[String], Version:[Int]){
   
    switch  modelName{
    case .iPhone : return iPhone
    case .iPhone3G : return iPhone3G
    case .iPhone3Gs : return iPhone3Gs
    case .iPhone4 : return iPhone4
    case .iPhone4s : return iPhone4s
    case .iPhone5 : return iPhone5
    case .iPhone5c : return iPhone5c
    case .iPhone5s : return iPhone5s
    case .iPhone6 : return iPhone6
    case .iPhone6Plus : return iPhone6Plus
    case .iPhone6s : return iPhone6s
    case .iPhone6sPlus : return iPhone6sPlus
    }
}

//Get Device with Model Number
func getDeviceWithModelNumber(modelNumber: ModelNumber) -> (Name:String, Number:[String], Hardware:[String], Version:[Int]) {
    
    switch modelNumber{
    case .A1203 : return iPhone
    case .A1324, .A1241: return iPhone3G
    case .A1303, .A1325 : return iPhone3Gs
    case .A1332: return iPhone4
    case .A1349 : return iPhone4
    case .A1387 : return iPhone4s
    case .A1428 : return iPhone5
    case .A1429 : return iPhone5
    case .A1431 : return iPhone5
    case .A1442 : return iPhone5
    case .A1453 : return iPhone5s
    case .A1456 : return iPhone5c
    case .A1457 : return iPhone5s
    case .A1507 : return iPhone5c
    case .A1522 : return iPhone6Plus
    case .A1524 : return iPhone6Plus
    case .A1529 : return iPhone5c
    case .A1530 : return iPhone5s
    case .A1532 : return iPhone5c
    case .A1533 : return iPhone5s
    case .A1549 : return iPhone6
    case .A1586 : return iPhone6
    case .A1633 : return iPhone6s
    case .A1634 : return iPhone6Plus
    case .A1687 : return iPhone6Plus
    case .A1688 : return iPhone6s
    }
}

//Get Device with HardWare String
func getDeviceWithHardwareString(hardwareString: HardwareString) -> (Name:String, Number:[String], Hardware:[String], Version:[Int]) {
    
    switch hardwareString {
    case .iPhone1_1 : return iPhone
    case .iPhone1_2 : return iPhone3G
    case .iPhone2_1 : return iPhone3Gs
    case .iPhone3_1, .iPhone3_2, .iPhone3_3 : return iPhone4
    case .iPhone4_1 : return iPhone4s
    case .iPhone5_1, .iPhone5_2 : return iPhone5
    case .iPhone5_3, .iPhone5_4 : return iPhone5c
    case .iPhone6_1, .iPhone6_2 : return iPhone5s
    case .iPhone7_2 : return iPhone6
    case .iPhone7_1 : return iPhone6Plus
    case .iPhone8_1 : return iPhone6s
    case .iPhone8_2 : return iPhone6sPlus
    }
}


////Get Device with OS Version
//// TODO: NEEDS TO RETURN ONE OR MORE DEVICE
//func getDeviceWithOSVersion(osVersion: OSVersion) -> (Name:String, Number:[String], Hardware:[String], Version:[Int]) {
//    switch osVersion.rawValue {
//    case 1...3: return iPhone
//    case 2...4: return iPhone3G
//    case 3...6: return iPhone3Gs
//    case 4...7: return iPhone4
//    case 5...9: return iPhone4s
//    case 6...9: return iPhone5
//    case 7...9: return (iPhone5c, iPhone5s)
//    case 8...9: return (iPhone6s, iPhone6Plus)
//    case 9: return iPhone6sPlus
//    default:
//        break
//    }
//}


//Testing get methods
let oldiPhone = getDeviceWithHardwareString(.iPhone1_1)
let midiPhone = getDeviceWithModelName(.iPhone4)
let latestiPhone = getDeviceWithModelNumber(.A1688)

print(oldiPhone.Name, terminator: "")
print(midiPhone.Name, terminator: "")
print(latestiPhone.Name, terminator: "")






