//
//  ViewController.swift
//  Photo Search Example
//
//  Created by Rosalyn Koscica on 12/8/15.
//  Copyright © 2015 Rosalyn Koscica. All rights reserved.
//
//
// Client ID: d0a70d0738474a27b6259a6ff0c82475


import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchInstagramByHashtag("dogs")
        
    }
    func searchInstagramByHashtag(searchString:String) {
        let manager = AFHTTPSessionManager()
        manager.GET("https://api.instagram.com/v1/tags/\(searchString)/media/recent?client_id=c4fc61c4704949baab8825cf178e13fe",
            parameters: nil,
            success: { (operation: NSURLSessionDataTask,responseObject: AnyObject?) in
                if let responseObject = responseObject {
                    if let dataArray = responseObject["data"] as? [AnyObject] {
                        var urlArray:[String] = []
                        for dataObject in dataArray {
                            if let imageURLString = dataObject.valueForKeyPath("images.standard_resolution.url") as? String {
                                urlArray.append(imageURLString)
                            }
                        }
                        self.scrollView.contentSize = CGSizeMake(320, 320 * CGFloat(dataArray.count))
                        
                        let imageWidth = self.view.frame.width
                        self.scrollView.contentSize = CGSizeMake(imageWidth, imageWidth * CGFloat(dataArray.count))
                        
                        for var i = 0; i < urlArray.count; i++ {
                            let imageView = UIImageView(frame: CGRectMake(0, imageWidth*CGFloat(i), imageWidth, imageWidth))
                            if let url = NSURL(string: urlArray[i]) {
                                imageView.setImageWithURL( url)
                                self.scrollView.addSubview(imageView)
                            }
                        }
                    }
                }
            },
            failure: { (operation: NSURLSessionDataTask?,error: NSError) in
                print("Error: " + error.localizedDescription)
        })
        
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.setValue("", forKey: " ")
        for subview in self.scrollView.subviews {
            subview.removeFromSuperview()
        }
        searchBar.resignFirstResponder()
        if let searchText = searchBar.text {
            searchInstagramByHashtag(searchText)
        }
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

