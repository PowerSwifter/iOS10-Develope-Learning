//
//  ViewController.swift
//  gestureDemo
//
//  Created by Boshi Li on 2016/11/5.
//  Copyright © 2016年 iOS TraingCamp-Boshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapHandler(_:)))
        let leftswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(toggleSwipe))
        leftswipeGesture.direction = .left
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(toggleSwipe))
        rightSwipeGesture.direction = .right
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePan(_:)))
        view.addGestureRecognizer(leftswipeGesture)
        view.addGestureRecognizer(rightSwipeGesture)
        birdImageView.addGestureRecognizer(panGesture)
        birdImageView.isUserInteractionEnabled = true
        birdImageView.addGestureRecognizer(tapGesture)
    }

    
    @IBOutlet weak var birdImageView: UIImageView! {
        didSet {
            birdImageView.image = UIImage(named: "owl")
            birdImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var showGestureLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapHandler(_ sender: UITapGestureRecognizer) {
        showGestureLabel.text = "bird taped"
    }
    
    func toggleSwipe(sender: UIGestureRecognizer) {
        if let swipeGesture =  sender as? UISwipeGestureRecognizer {
            if swipeGesture.direction == .left {
                showGestureLabel.text = "left Swipe"
                print(showGestureLabel.text!)
            }
            if swipeGesture.direction == .right {
                showGestureLabel.text = "right Swipe"
                print(showGestureLabel.text!)
            }
        }
    }
    
    func handlePan(_ sender: UIPanGestureRecognizer){
        print("pan")
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translation(in: view)
            if fabs(translation.x) > fabs(translation.y) {
                return true
            }
            if fabs(translation.x) < fabs(translation.y) {
                print("pan y")
                return false
            }
            return false
        }
        return false
    }
    
//    var currentPoint = touches.first!.locationInView(self!.view)
//    var prevPoint = touches.first!.previousLocationInView(self!.view)
//    moveX += prevPoint.x - currentPoint.x
//    moveY += prevPoint.y - currentPoint.y


}

