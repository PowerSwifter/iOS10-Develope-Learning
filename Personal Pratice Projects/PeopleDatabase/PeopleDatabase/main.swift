//
//  main.swift
//  PeopleDatabase
//
//  Created by Boshi Li on 2016/6/30.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import Foundation

class Person  {
    
    var firstName = ""
    var lastName = ""
    var age = 0
    
    func input() -> String {
        let keyboard = NSFileHandle.fileHandleWithStandardInput()
        let inputData = keyboard.availableData
        let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
        if let string = rawString {
            return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        } else {
            return "Invalid input"
        }
    }
    
    func changeFirstName(newFirstName:String) {
        firstName = newFirstName
    }
    
    func enterInfo()  {
        print("What is the first name?")
        firstName = input()
        print("What is the \(firstName)'s last name?")
        lastName = input()
        print("How old is \(firstName) \(lastName)?")
        while (true){
            let userInput = Int(input())
            if let number = userInput{
                age = number
                break
            }else{
                print("Please Enter a number")
                continue
            }
        }
    }
    
    func printInfo()  {
        print("\(firstName) \(lastName) is \(age) years old.")
    }
    
}

var response:String
var people: [Person] = []
repeat{
    var newPerson = Person()
    newPerson.enterInfo()
    people.append(newPerson)
    newPerson.printInfo()
    print("Do you want to enter another name? (y)")
    response = input()
}while(response == "y")

for peopleData in people{
    print(peopleData.printInfo())
}


