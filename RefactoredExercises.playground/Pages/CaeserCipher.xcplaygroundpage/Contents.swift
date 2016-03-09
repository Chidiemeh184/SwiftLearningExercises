//================================================================
//  NAME: CHIDI EMEH
//  COURSE: CSCI 2994 (iOS Programming Fundamentals)
//  FILENAME: carserCipher.playground
//  DATE: 03/08/2016
//  EXERCISE 3: This program shows basic program caeser cipher
//              This shift can be varied
//              This is a refactored versionn
//=================================================================

/*:
**Exercise:** You have a secret message to send. Write a playground that can encrypt strings with an alphabetical [caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher). This cipher can ignore numbers, symbols, and whitespace.
>> **Example Output:**
* Decrypted: Nearly all men can stand adversity, but if you want to test a man's character, give him power
* Encrypted: arneyl nyy zra pna fgnaq nqirefvgl, ohg vs lbh jnag gb grfg n zna'f punenpgre, tvir uvz cbjre
>> **Constraints:**
* The encrypted and decrypted text is case sensitive
* Add a shift variable to indicate how many places to shift
*/

import Foundation

var plaintext = "Nearly all men can stand adversity, but if you want to test a man's character, give him power"
let key = 13
let encrypted = encrypt(plaintext, encryptByValue: key)
let decrypted = decrypt(encrypted, decryptByValue: key)

print("Encrypted:\(encrypted)")
print("Deciphered:\(decrypted)")

//: [Previous](@previous) < > [Next](@next)
