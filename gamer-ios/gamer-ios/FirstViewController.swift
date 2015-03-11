//
//  FirstViewController.swift
//  gamer-ios
//
//  Created by Leland on 3/10/15.
//  Copyright (c) 2015 gamer. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  
    @IBOutlet var feedTableView: UITableView!
    
    let content = [
        ("@ianjsikora","SmallWorldsSF","Looking for suggestions of the best early-game, mid-game and end-game combos…"),
        ("@MotherRussia","Riskey Business","Quick qustison on the rules, my friend had an argument about sorcerers the other… "),
        ("@SingaporeSling","SmallWorldsSF","Check out my new Medium post on why SmallWorlds is the best game http://w…"),
        ("@BabyMocker","Magic4Life","Great artwork in the new game!"),
        ("@ianjsikora","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@BabyMocker","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@MotherRussia","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@SingaporeSling","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@ianjsikora","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@ianjsikora","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@MotherRussia","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@BabyMocker","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@SingaporeSling","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@ianjsikora","SmallWorldsSF","Looking for suggestions of the best early-game, mid-game and end-game combos…"),
        ("@MotherRussia","Riskey Business","Quick qustison on the rules, my friend had an argument about sorcerers the other… "),
        ("@SingaporeSling","SmallWorldsSF","Check out my new Medium post on why SmallWorlds is the best game http://w…"),
        ("@BabyMocker","Magic4Life","Great artwork in the new game!"),
        ("@ianjsikora","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@BabyMocker","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@MotherRussia","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@SingaporeSling","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@ianjsikora","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@ianjsikora","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@MotherRussia","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@BabyMocker","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor"),
        ("@SingaporeSling","Group A", "Lorem ipsum dolor sit amit, consectetur adipiscing elit, sed eiusmod tempor")]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return content.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("feed-cell", forIndexPath: indexPath) as UITableViewCell
        
        let(userName, groupName, postContent) = content[indexPath.row]
        cell.textLabel?.text = "\(userName) in \(groupName)"
        cell.detailTextLabel?.text = postContent
        
        var myImage = UIImage(named:"Ian")
        
        if userName == "@ianjsikora" {
            myImage = UIImage(named:"Ian")
        }else if userName == "@MotherRussia" {
            myImage = UIImage(named:"Janna")
        }else if userName == "@SingaporeSling" {
            myImage = UIImage(named:"Andy")
        }else if userName == "@BabyMocker" {
            myImage = UIImage(named:"Andreas")
        }
        
        cell.imageView?.image = myImage
        
        return cell
        
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("initial viewDidLoad of FirstViewController")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}




