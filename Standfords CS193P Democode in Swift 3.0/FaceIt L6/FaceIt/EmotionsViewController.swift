//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Boshi Li on 2016/10/11.
//  Copyright © 2016年 Stanford University. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {
    
    let instance = getEmotionsMVCinstanceCount()
    
    private let emotionalFace : Dictionary<String, FacialExpression> = [
        "angry" : FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy" : FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried" : FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
        "mischievous" : FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin),
        
        ]
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationvc = segue.destination
        if let navcon = destinationvc as? UINavigationController {
            destinationvc = navcon.visibleViewController ?? destinationvc
        }
        if let facevc = destinationvc as? FaceViewController{
            if let identifier = segue.identifier {
                if let expression = emotionalFace[identifier] {
                    facevc.expression = expression
                    if let sendingButton = sender as? UIButton {
                        facevc.navigationItem.title = sendingButton.currentTitle
                    }
                }
                
            }
        }
    }
}
