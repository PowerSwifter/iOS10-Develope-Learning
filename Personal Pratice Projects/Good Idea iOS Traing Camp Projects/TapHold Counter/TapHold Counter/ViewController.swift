//
//  ViewController.swift
//  TapHold Counter
//
//  Created by Boshi Li on 2016/7/15.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    @IBOutlet weak var tapHoldButton: UIButton!
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        longPressGesture()
    }
    
    @IBAction func resetPressed(){
        counter = 0
        counterLabel.text = "\(counter)"
    }
    
    @IBAction func normalPressed(){
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
    func longPressAction(){
        counter += 1
        counterLabel.text = "\(counter)"
    }
    
    
    func longPressGesture() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressAction))
        longPress.minimumPressDuration = 0.5
        tapHoldButton.addGestureRecognizer(longPress)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

