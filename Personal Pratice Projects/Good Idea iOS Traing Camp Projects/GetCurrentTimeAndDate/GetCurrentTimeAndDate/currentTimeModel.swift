//
//  currentTimeModel.swift
//  GetCurrentTimeAndDate
//
//  Created by Boshi Li on 2016/9/19.
//  Copyright © 2016年 iOSTraingCamp_Boshi Li. All rights reserved.
//

import Foundation

class currentTimeModel{
    
    func getCurrentTime() -> String{
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd, yyyy HH:mm:ss a"
        let newDate = dateFormatter.string(from: currentDate)
        return(newDate)
    }
    
}
