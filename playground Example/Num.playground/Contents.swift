//: Playground - noun: a place where people can play

import UIKit


//for i in 1...9{
//    for k in 1...9{
//        print("\(i)*\(k) = \(i*k)")
//    }
//}
//
//let base = 3
//let power = 10
//var answer = 1
//for _ in 1...power {
//    answer *= base
//}
//
//let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
//for (animalName, legCount) in numberOfLegs {
//    print("\(animalName)s have \(legCount) legs")
//}
//
//var c = 0
//while c < 10 {
//    c += 1
//}
//
//var switch01 = false
//if switch01 {
//    print("light is ON")
//}else {
//    print("light is OFF")
//}
////light is OFF
//
//var temperature = 24
//
//if temperature >= 28 {
//    print("turn on the air conditioner")
//}else if temperature <= 25 {
//    print("turn off the air conditioner")
//}
//
//enum weather {
//    case aNum
//    case bNum
//}
//
//let Bnum = 11
//
//switch Bnum {
//case 1...5:
//    print("A")
//case 6...10:
//    print("B")
//default:
//    break
//}

//let a = (9, 8)
//switch a {
//case (let x, 0):
//    print("on the x-axis with an x value of \(x)")
//case let (x, y):
//    print("(\(x), \(y))")
//}
////(9, 8)


//函式：計算矩形面積
func rectangleArea( width:Double, height:Double ) -> Double {
    let area = width * height
    return area
}
//函式：計算三角形面積
func triangleArea( bottom:Double, height:Double ) -> Double {
    let area = 0.5 * bottom * height
    return area
}
//函式：判斷形狀並回傳面積計算公式
func getArea(shape : String ) -> ( Double, Double ) -> Double {
    switch (shape) {
    case "rect":
        return rectangleArea
    case "tria":
        return triangleArea
    default:
        return rectangleArea
    }
}

func multiply(_ aNum: Int,_ bNum: Int) -> Int {
    return aNum * bNum
}
print(multiply(10, 6))

