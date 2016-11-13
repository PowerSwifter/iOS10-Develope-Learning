//
//  ViewController.swift
//  image scroller
//
//  Created by Boshi Li on 2016/10/31.
//  Copyright © 2016年 iOS TraingCamp-Boshi. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    struct URLs {
        static let youtubeImage = "https://wallpaperscraft.com/image/dubai_uae_buildings_skyscrapers_night_96720_3840x2160.jpg"
    }
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        imageURL = URL(string: URLs.youtubeImage)
        
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            spinner?.stopAnimating()
            //scrollView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            //scrollView?.contentOffset = CGPoint(x:500, y:400)
        }
    }
    
    var imageURL : URL? {
        didSet{
            image = nil
            fetchImage()
        }
    }

    private func fetchImage() {
        if let url = imageURL {
            spinner?.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { [weak weakSelf = self] in
                if url == weakSelf?.imageURL{
                    if let imageData = try? Data(contentsOf: url ) {
                        weakSelf?.image = UIImage(data: imageData)
                    }else {
                        weakSelf?.spinner?.stopAnimating()
                    }
                }
            }
        }
    }

    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView.contentSize = imageView.bounds.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.19
            
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}

