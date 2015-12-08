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

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = AFHTTPRequestOperation()
        manager.GET( "https://api.instagram.com/v1/tags/cats/media/recent?client_id=d0a70d0738474a27b6259a6ff0c82475",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation?,responseObject: AnyObject!) in
                print("JSON: " + responseObject.description)
            },
            failure: { (operation: AFHTTPRequestOperation?,error: NSError!) in
                print("Error: " + error.localizedDescription)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

