//: Playground - noun: a place where people can play

import UIKit


for i in 1...9{
    for k in 1...9{
        print("\(i)*\(k) = \(i*k)")
    }
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

var c = 0
while c < 10 {
    c += 1
}

var switch01 = false
if switch01 {
    print("light is ON")
}else {
    print("light is OFF")
}
//light is OFF

var temperature = 24

if temperature >= 28 {
    print("turn on the air conditioner")
}else if temperature <= 25 {
    print("turn off the air conditioner")
}

enum weather {
    case aNum
    case bNum
}
var tomorrowWeathrt = weather.aNum
switch tomorrowWeathrt {
case .aNum : print("a")
    case .b
}
