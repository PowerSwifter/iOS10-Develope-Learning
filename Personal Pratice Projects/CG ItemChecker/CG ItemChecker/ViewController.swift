//
//  ViewController.swift
//  CG ItemChecker
//
//  Created by Boshi Li on 2016/7/27.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var Switch00: UISwitch!
    @IBOutlet var Switch01: UISwitch!
    @IBOutlet var Switch02: UISwitch!
    @IBOutlet var Switch03: UISwitch!
    @IBOutlet var Switch04: UISwitch!
    @IBOutlet var Switch05: UISwitch!
    @IBOutlet var Switch06: UISwitch!
    @IBOutlet var Switch07: UISwitch!
    @IBOutlet var Switch08: UISwitch!
    @IBOutlet var Switch09: UISwitch!
    @IBOutlet var Switch10: UISwitch!
    @IBOutlet var Switch11: UISwitch!
    let userDefaults00 = NSUserDefaults.standardUserDefaults()
    let userDefaults01 = NSUserDefaults.standardUserDefaults()
    let userDefaults02 = NSUserDefaults.standardUserDefaults()
    let userDefaults03 = NSUserDefaults.standardUserDefaults()
    let userDefaults04 = NSUserDefaults.standardUserDefaults()
    let userDefaults05 = NSUserDefaults.standardUserDefaults()
    let userDefaults06 = NSUserDefaults.standardUserDefaults()
    let userDefaults07 = NSUserDefaults.standardUserDefaults()
    let userDefaults08 = NSUserDefaults.standardUserDefaults()
    let userDefaults09 = NSUserDefaults.standardUserDefaults()
    let userDefaults10 = NSUserDefaults.standardUserDefaults()
    let userDefaults11 = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (userDefaults00.objectForKey("Switch00On") != nil){
            Switch00.on = userDefaults00.boolForKey("Switch00On")
        }
        if (userDefaults01.objectForKey("Switch01On") != nil){
            Switch01.on = userDefaults01.boolForKey("Switch01On")
        }
        if (userDefaults02.objectForKey("Switch02On") != nil){
            Switch02.on = userDefaults02.boolForKey("Switch02On")
        }
        if (userDefaults03.objectForKey("Switch03On") != nil){
            Switch03.on = userDefaults03.boolForKey("Switch03On")
        }
        if (userDefaults04.objectForKey("Switch04On") != nil){
            Switch04.on = userDefaults04.boolForKey("Switch04On")
        }
        if (userDefaults05.objectForKey("Switch05On") != nil){
            Switch05.on = userDefaults05.boolForKey("Switch05On")
        }
        if (userDefaults06.objectForKey("Switch06On") != nil){
            Switch06.on = userDefaults06.boolForKey("Switch06On")
        }
        if (userDefaults07.objectForKey("Switch07On") != nil){
            Switch07.on = userDefaults07.boolForKey("Switch07On")
        }
        if (userDefaults08.objectForKey("Switch08On") != nil){
            Switch08.on = userDefaults08.boolForKey("Switch08On")
        }
        if (userDefaults09.objectForKey("Switch09On") != nil){
            Switch09.on = userDefaults09.boolForKey("Switch09On")
        }
        if (userDefaults10.objectForKey("Switch10On") != nil){
            Switch10.on = userDefaults10.boolForKey("Switch10On")
        }
        if (userDefaults11.objectForKey("Switch11On") != nil){
            Switch11.on = userDefaults11.boolForKey("Switch11On")
        }
    }

    @IBAction func SwitchChanged00(sender: AnyObject) {
        
        if Switch00.on {
            print("ON")
            userDefaults00.setBool(true, forKey: "Switch00On")
        }else{
            print("OFF")
            userDefaults00.setBool(false, forKey: "Switch00On")
        }
    }
    
    @IBAction func SwitchChanged01(sender: AnyObject) {
        if Switch01.on {
            userDefaults01.setBool(true, forKey: "Switch01On")
        }else{
            userDefaults01.setBool(false, forKey: "Switch01On")
        }
    }
    
    @IBAction func SwitchChanged02(sender: AnyObject) {
        if Switch02.on {
            userDefaults02.setBool(true, forKey: "Switch02On")
        }else{
            userDefaults02.setBool(false, forKey: "Switch02On")
        }
    }
    
    @IBAction func SwitchChanged03(sender: AnyObject) {
        if Switch03.on {
            userDefaults03.setBool(true, forKey: "Switch03On")
        }else{
            userDefaults03.setBool(false, forKey: "Switch03On")
        }
    }
    
    @IBAction func SwitchChanged04(sender: AnyObject) {
        if Switch04.on {
            userDefaults04.setBool(true, forKey: "Switch04On")
        }else{
            userDefaults04.setBool(false, forKey: "Switch04On")
        }
    }
    
    @IBAction func SwitchChanged05(sender: AnyObject) {
        if Switch05.on {
            userDefaults05.setBool(true, forKey: "Switch05On")
        }else{
            userDefaults05.setBool(false, forKey: "Switch05On")
        }
    }
    
    @IBAction func SwitchChanged06(sender: AnyObject) {
        if Switch06.on {
            userDefaults06.setBool(true, forKey: "Switch06On")
        }else{
            userDefaults06.setBool(false, forKey: "Switch06On")
        }
    }
    
    @IBAction func SwitchChanged07(sender: AnyObject) {
        if Switch07.on {
            userDefaults07.setBool(true, forKey: "Switch07On")
        }else{
            userDefaults07.setBool(false, forKey: "Switch07On")
        }
    }
    
    @IBAction func SwitchChanged08(sender: AnyObject) {
        if Switch08.on {
            userDefaults08.setBool(true, forKey: "Switch08On")
        }else{
            userDefaults08.setBool(false, forKey: "Switch08On")
        }
    }
    
    @IBAction func SwitchChanged09(sender: AnyObject) {
        if Switch09.on {
            userDefaults09.setBool(true, forKey: "Switch09On")
        }else{
            userDefaults09.setBool(false, forKey: "Switch09On")
        }
    }
    
    @IBAction func SwitchChanged10(sender: AnyObject) {
        if Switch10.on {
            userDefaults10.setBool(true, forKey: "Switch10On")
        }else{
            userDefaults10.setBool(false, forKey: "Switch10On")
        }
    }
    
    @IBAction func SwitchChanged11(sender: AnyObject) {
        if Switch11.on {
            userDefaults11.setBool(true, forKey: "Switch11On")
        }else{
            userDefaults11.setBool(false, forKey: "Switch11On")
        }
    }
    
    


}

