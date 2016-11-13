//
//  ToDoTableViewCell.swift
//  AddNewItem
//
//  Created by Boshi Li on 2016/11/5.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.delegate = self
        }
    }
    
    var buttonPostion = CGFloat()
    
    var editButtonDidTapDelegate : editButtonDidTap?
    
    var cellButtonsViews = [UIImageView]()
    
    var cellButtonsImages: [UIImage]? {
        didSet {
            for i in 0..<cellButtonsImages!.count{
                cellButtonsViews.append(UIImageView(image: cellButtonsImages![i]))
                cellButtonsViews[i].sizeToFit()
                cellButtonsViews[i].contentMode = .scaleAspectFit

                //loadVisiableImages()
            }
        }
    }

    
    
    // MARK: - Oulets
    
    
    // MARK: - Actions
    
    func updateUI() {
        let dateFormatter =  DateFormatter()
        dateFormatter.dateFormat = "MM/dd"
        //toDoWorkLabel.text = cellDataProt?.workData
        //whisToFinishedDateLabel.text = dateFormatter.string(from: (cellDataProt?.workDate)!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        cellButtonsImages = [UIImage(named: "success")!,
                      UIImage(named: "calendar")!,
                      UIImage(named: "edit")!]
        
        creatButton(cellButtonsViews: cellButtonsViews)

//

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func creatButton(cellButtonsViews: [UIImageView]) {
        for imageView in cellButtonsViews {
            let button = UIButton()
            button.frame = CGRect(x: buttonPostion, y: 5, width: 32.0, height: 32.0)
            buttonPostion += CGFloat((imageView.frame.size.width) / 1.5)
            imageView.center = button.center
            button.addSubview(imageView)
            
            scrollView.addSubview(button)
            let scrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSize(width: imageView.bounds.width * CGFloat(cellButtonsViews.count) + scrollViewSize.width,
                                            height: scrollViewSize.height)
        }
    }

}


