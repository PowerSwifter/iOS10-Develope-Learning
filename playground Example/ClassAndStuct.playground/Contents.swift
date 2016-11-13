//: Playground - noun: a place where people can play

import UIKit

// MARK: - Define Class and Struct

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// MARK: - Struct instance

var hdVideo = Resolution(width: 1920, height: 1080)

// MARK: - class instance

var someVideo = VideoMode()

// MARK: - compare reference type and value type

var sdVideo = hdVideo

sdVideo.height = 680
//
print(hdVideo.height, sdVideo.height)
//
someVideo.name = "MBI I"
//
var antotherVideo = someVideo
//
antotherVideo.name = "MBI II"
//
print(someVideo.name!, antotherVideo.name!)


// MARK: - initializers

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

class element {
    var contant: String
    init() {
        contant = "pizza"
    }
}
var forecast = Fahrenheit()
var box = element()
print(forecast.temperature, box.contant)


// MARK: - base Clasee

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

// MARK: - Car Override Demo

class Car: Vehicle{
    var gear = 0
    
    override var description: String{
        return super.description + " in gear \(gear)"
    }
    override func makeNoise(){
        print("boo")
    }
}

// MARK: - AutoCar Override Property Observers

class AutoCar:Car {
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 30) + 1
        }
    }
}

var autocar = AutoCar()

autocar.currentSpeed = 12.3
autocar.description
