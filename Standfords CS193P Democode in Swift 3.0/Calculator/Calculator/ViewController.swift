//
//  ViewController.swift
//  Calculator
//
//  Created by Boshi Li on 2016/9/7.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak fileprivate var display: UILabel!
    fileprivate var removeThefistZero = false
    
    @IBAction fileprivate func touchDigt(_ sender: UIButton) {
        let digt = sender.currentTitle!
        
        if removeThefistZero {
            let currentlyDigtDisplay = display.text!
            display.text! = currentlyDigtDisplay + digt
        }else{
            display.text! = digt
        }
        removeThefistZero = true
    }

    fileprivate var displayValue: Double {
        get{
            return Double(display.text!)!
        }
        set{
            display.text = String(newValue)
        }
        
    }
    var saveProgram: CaculatorModel.PropertyList?
    @IBAction func save() {
        saveProgram = model.program
    }
    
    @IBAction func restore() {
        if saveProgram != nil {
            model.program = saveProgram!
            displayValue = model.result
        }
    }
    
    
    fileprivate var model = CaculatorModel()
    
    @IBAction fileprivate func performOperation(_ sender: UIButton) {
        if removeThefistZero{
            model.setOprand(oprand: displayValue)
            removeThefistZero = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            model.performOperatoion(symbol: mathematicalSymbol)
        }
        displayValue = model.result
    }

}

