//
//  ToDoTableViewCell.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/11/5.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell,  BlockPanGestureInCell{
    
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    var completedOnDragRelease = false
    var maxTranslationHeight = CGFloat()
    var tableViewCellPanGesturesDelegate : TableViewCellPanGesturesDelegate?
    var editButtonDidTapDelegate : editButtonDidTap?
    var fingerMovePoint = CGPoint()
    var blockPanGesture = true
    var animationOptions : UIViewAnimationOptions = [.allowUserInteraction, .beginFromCurrentState]
    
    
    
    // MARK: - Oulets
    @IBOutlet weak var toDoWorkLabel: UILabel!
    @IBOutlet weak var whisToFinishedDateLabel: UILabel!
    
    private var editButtonImagView = UIImageView()
    @IBOutlet weak var editButtonView: UIButton!
    
    var editImage: UIImage? {
        get {
            return editButtonImagView.image
        }
        set {
            editButtonImagView.image = newValue
            editButtonImagView.sizeToFit()
            editButtonImagView.center = editButtonView.center
            editButtonImagView.contentMode = .scaleAspectFill
            editButtonView.addSubview(editButtonImagView)
        }
    }
    
    
    // MARK: - Actions
    
    func updateUI() {
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        toDoWorkLabel.text = cellDataProt?.workData
        whisToFinishedDateLabel.text = dateFormatter.string(from: (cellDataProt?.workDate)!)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        editImage = UIImage(named: "edit")
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        //panRecognizer.delegate = self
        self.contentView.addGestureRecognizer(panRecognizer)
        // Initialization code
    }
    
    @IBAction func editButton(_ sender: UIButton) {
        editButtonDidTapDelegate?.editAction(buttonSender: sender, whith: self)
    }
    
    var cellDataProt : cellDataPort? {
        didSet {
            updateUI()
        }
    }
    func didPan(_ recognizer : UIPanGestureRecognizer) {
        
        if recognizer.state == .began {
            recognizer.isEnabled = true
            let didGestureLocation = recognizer.location(in: self)
            fingerMovePoint = CGPoint(x: didGestureLocation.x, y:didGestureLocation.y)
            maxTranslationHeight = self.frame.size.height
            
            // when the gesture begins, record the current center location
            originalCenter = center
            
        }
        // 2
        if recognizer.state == .changed {
            let translation = recognizer.translation(in: self)
            let originalFrame = CGRect(x: 0, y: frame.origin.y,
                                       width: bounds.size.width,
                                       height: bounds.size.height)
            center = CGPoint(x:originalCenter.x + translation.x, y:originalCenter.y)
            fingerMovePoint.y = translation.y
            if fingerMovePoint.y > maxTranslationHeight {
                recognizer.isEnabled = false
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 2,
                               options: self.animationOptions,
                               animations:{self.frame = originalFrame},
                               completion: nil)
                let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {_ in recognizer.isEnabled = true})
                timer.fire()
            }
            // has the user dragged the item far enough to initiate a delete/complete?
            deleteOnDragRelease = frame.origin.x < -frame.size.width / 2.5
            completedOnDragRelease = frame.origin.x > frame.size.width / 2.0
        }
        // 3
        if recognizer.state == .ended {

            //Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(disableCell), userInfo: nil, repeats: false)
            self.contentView.addGestureRecognizer(recognizer)
            // the frame this cell had before user dragged it
            let originalFrame = CGRect(x: 0, y: frame.origin.y,
                                       width: bounds.size.width,
                                       height: bounds.size.height)
            if !deleteOnDragRelease {
                // if the item is not being deleted, snap back to the original location
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 2,
                               options: self.animationOptions,
                               animations: {self.frame = originalFrame},
                               completion: nil)
                
            }
            
            if !completedOnDragRelease {
                // if the item is not being deleted, snap back to the original location
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 2,
                               options: self.animationOptions,
                               animations:{self.frame = originalFrame},
                               completion: nil)
                
                
            }
            if deleteOnDragRelease {
                tableViewCellPanGesturesDelegate?.toDoCellDidPanGestures(cell: self, didPan: recognizer, gesture: gestureMethods.panLeft)
            }
            if completedOnDragRelease {
                tableViewCellPanGesturesDelegate?.toDoCellDidPanGestures(cell: self, didPan: recognizer, gesture: gestureMethods.panRight)
                UIView.animate(withDuration: 0.5,
                               delay: 0,
                               usingSpringWithDamping: 0.5,
                               initialSpringVelocity: 2,
                               options: self.animationOptions,
                               animations: {self.contentView.frame = originalFrame},
                               completion: nil)
            }
        }
    }
    
    func didScrollInItSuperView(didBlock blockPan: Bool, from sender: UITableViewController) {
        blockPanGesture = blockPan
    }
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if blockPanGesture {
            if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
                let translation = panGestureRecognizer.translation(in: self.contentView)
                if fabs(translation.x) > fabs(translation.y) {
                    gestureRecognizer.isEnabled = true
                    return true
                }
                return false
            }
            return false
        }
        return false
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

    
}

