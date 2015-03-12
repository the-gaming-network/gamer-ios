//
//  FirstViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/11/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

//import UIKit
//
//class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    @IBOutlet var feedTableView: UITableView!
//    
//        
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return content.count
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        var cell = tableView.dequeueReusableCellWithIdentifier("feed-cell", forIndexPath: indexPath) as UITableViewCell
//        
//        let (userName, groupName, postContent) = content[indexPath.row]
//        cell.textLabel?.text = "\(userName) in \(groupName)"
//        cell.detailTextLabel?.text = postContent
//        
//        var myImage = UIImage(named:"Ian")
//        
//        if userName == "@ianjsikora" {
//            myImage = UIImage(named:"Ian")
//        }else if userName == "MotherRussia" {
//            myImage = UIImage(named:"Janna")
//        }else if userName == "@SingaporeSling" {
//            myImage = UIImage(named:"Andy")
//        }else if userName == "@BabyMocker" {
//            myImage = UIImage(named:"Andreas")
//        }
//        
//        cell.imageView?.image = myImage
//        
//        return cell
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        println("initial viewDidLoad of FirstViewController")
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
