//
//  ViewController.swift
//  swiftiAd01
//
//  Created by Boshi Li on 2016/7/26.
//  Copyright © 2016年 Boshi Li. All rights reserved.
//

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    //Mark: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adBannerView.delegate = self
        self.adBannerView.hidden = true
        self.canDisplayBannerAds = true
    }

    //Mark: Outlets
    @IBOutlet weak var adBannerView: ADBannerView!

    //Mark : Banner functions
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        adBannerView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        adBannerView.hidden = true
    }
}

