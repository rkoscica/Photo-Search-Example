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
        manager.GET("https://api.instagram.com/v1/tags/clararockmore/media/recent?client_id=c4fc61c4704949baab8825cf178e13fe", parameters: nil, success: { (task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
                print("JSON: " + responseObject!.description)
            
            }) { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                print("Error: " + error.localizedDescription)
            
        }
     
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

