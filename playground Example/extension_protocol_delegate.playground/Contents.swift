//: Playground - noun: a place where people can play

import UIKit

// Demo 1

protocol Hello {
    func Hello() -> String
}

protocol numberAndName {
    var number: Int {get}
    var name: String {get}
    init (number: Int, name: String)
}


class July : Hello, numberAndName{

    var number: Int
    var name: String
    required init(number : Int, name:String) {
        self.number = number
        self.name = name
    }

    func Hello() -> String {
        return "hello to \(name)"
    }
    
    func printJuly () {
        for _ in 0...self.number{
            print(self.Hello())
        }
    }
}

var hue = July(number: 1, name: "May")
hue.printJuly()


// Demo 2

protocol oneMethod {
    func returnInt() -> Int
}

class aClassInheritOneMethod : oneMethod {
    func returnInt() -> Int {
        return 5
    }
}

class oneValueClass {
    var numberReturnByProtocol : oneMethod
    init(number: oneMethod) {
        self.numberReturnByProtocol = number
    }
}

var aInstance = aClassInheritOneMethod()

let bNumber = oneValueClass(number: aInstance) // aInstance 是繼承 oneMethod protocol 所以可以在這個參數放入
print(bNumber.numberReturnByProtocol.returnInt())


// extension

//extension oneMethod {
//    func secondMethod() {
//        print("second method")
//    }
//}
//
//aInstance.secondMethod()

//Create the protocol

protocol RatingPickerDelegate {
    func preferredRatingSymbol(picker: RatingPicker) -> UIImage?
    func didSelectRating(picker: RatingPicker, rating: Int)
    func didCancel(picker: RatingPicker)
}

//Create the delegator

class RatingPicker {
    var delegate: RatingPickerDelegate?
    
    func setup() {
        let preferredRatingSymbol = delegate?.preferredRatingSymbol(picker: self)
        
        // Set up the picker with the preferred rating symbol if it was specified
    }
    
    func selectRating(selectedRating: Int) {
        delegate?.didSelectRating(picker: self, rating: selectedRating)
        // Other logic related to selecting a rating
    }
    
    func cancel() {
        delegate?.didCancel(picker: self)
        // Other logic related to canceling
    }
}

//Choosing the delegate

class RatingPickerHandler: RatingPickerDelegate {
    func preferredRatingSymbol(picker: RatingPicker) -> UIImage? {
        return UIImage(contentsOfFile: "Star.png")
    }
    
    func didSelectRating(picker: RatingPicker, rating: Int) {
        // do something in response to a rating being selected
    }
    
    func didCancel(picker: RatingPicker) {
        // do something in response to the rating picker canceling
    }
}

