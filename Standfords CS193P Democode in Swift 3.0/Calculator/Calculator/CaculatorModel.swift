//
//  CaculatorModel.swift
//  Calculator
//
//  Created by Boshi Li on 2016/9/12.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import Foundation


class CaculatorModel{
    private var accumalator = 0.0
    private var internalProgram = [AnyObject]()
    func setOprand(oprand:Double) {
        accumalator = oprand
        internalProgram.append(oprand as AnyObject)
    }
    
    private var operations : Dictionary<String, Operation> = [
        "π" : Operation.constant(M_PI),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOpreation(sqrt),
        "cos" : Operation.unaryOpreation(cos),
        "×" : Operation.binaryOpreation({$0 * $1}),
        "+" : Operation.binaryOpreation({$0 + $1}),
        "−" : Operation.binaryOpreation({$0 - $1}),
        "÷" : Operation.binaryOpreation({$0 / $1}),
        "=" : Operation.equals
        
    ]
    
    private enum Operation {
        case constant(Double)
        case unaryOpreation((Double) -> Double)
        case binaryOpreation((Double, Double) -> Double)
        case equals
    }
    
    func performOperatoion(symbol : String) {
        internalProgram.append(symbol as AnyObject)
        if let operation = operations[symbol]{
            switch operation {
            case .constant(let value):
                accumalator = value
            case .unaryOpreation(let fuction):
                accumalator = fuction(accumalator)
            case .binaryOpreation(let function):
                excutePendingBinaryOperation()
                pending = PendingBianryOperationInfo(binaryFuntion: function, firstOprand: accumalator)
            case .equals:
                excutePendingBinaryOperation()
            }
        }
    }
    
    private func excutePendingBinaryOperation(){
        if pending != nil {
            accumalator = pending!.binaryFuntion(pending!.firstOprand, accumalator)
            pending = nil
        }
    }
    
    private var pending : PendingBianryOperationInfo?
    
    private struct PendingBianryOperationInfo {
        var binaryFuntion: (Double, Double) -> Double
        var firstOprand : Double
    }
    typealias PropertyList = AnyObject
    
    var program: PropertyList {
        get {
            return internalProgram as CaculatorModel.PropertyList
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject]{
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOprand(oprand: operand)
                    } else if let operation = op as? String {
                        performOperatoion(symbol: operation)
                    }
                }
            }
        }
    }
    func clear() {
        accumalator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result: Double {
        get{
            return accumalator
        }
        
    }
}
