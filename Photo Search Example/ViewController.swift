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

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let manager = AFHTTPSessionManager()
        manager.GET("https://api.instagram.com/v1/tags/clararockmore/media/recent?client_id=c4fc61c4704949baab8825cf178e13fe", parameters: nil,
            success: {  (task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
                print("JSON: " + responseObject!.description)
                
                if let dataArray = responseObject!["data"] as? [AnyObject] {
                    var urlArray:[String] = []
                    for dataObject in dataArray {
                        if let imageURLString = dataObject.valueForKeyPath("images.standard_resolution.url") as? String {
                            urlArray.append(imageURLString)
                        }
                    }
                    self.scrollView.contentSize = CGSizeMake(320, 320 * CGFloat(dataArray.count))
                    for var i = 0; i < urlArray.count; i++ {
                        let imageData = NSData(contentsOfURL: NSURL(string: urlArray[i])!)
                        if let imageDataUnwrapped = imageData {                 
                            let imageView = UIImageView(image: UIImage(data: imageDataUnwrapped))
                            imageView.frame = CGRectMake(0, 320 * CGFloat(i), 320, 320)
                            self.scrollView.addSubview(imageView)
                        }
                    }
                }
            
            }) { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("Error: " + error.localizedDescription)
           
        }
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

