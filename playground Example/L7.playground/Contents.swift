//: Playground - noun: a place where people can play

import UIKit

public class Employee{
    var salary: Int{
        set{
            self.salary = newValue
        }
        get{
            return self.salary
        }
    }
}




var employee = Employee()

employee.salary = 15000
//
//
//print("the employee\(employee.Name)'s salary is \(employee.Salary)")
