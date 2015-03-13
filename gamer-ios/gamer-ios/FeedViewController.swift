//
//  FeedViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    
    // Code to populate the feed
    var posts: [FeedPost] = feedContent
        
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
            -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedPostCell", forIndexPath: indexPath) as FeedPostCell
        let post = posts[indexPath.row] as FeedPost
        
        // defining new variables in each table cell
        cell.userNameLabel.text = post.userName
        cell.groupNameLabel.text = post.groupName
        cell.postContentLabel.text = post.postContent
        cell.postCommentsLabel.text = "\(post.commentCount) comments"
        cell.postUpvotesLabel.text = "\(post.upvoteCount) upvotes"
        
        // temp code to select the right profile pic
        var postImage = UIImage(named:"Ian")
        if post.userName == "@ianjsikora" {
            postImage = UIImage(named:"Ian")
        }else if post.userName == "@MotherRussia" {
            postImage = UIImage(named:"Janna")
        }else if post.userName == "@SingaporeSling" {
            postImage = UIImage(named:"Andy")
        }else if post.userName == "@BabyMocker" {
            postImage = UIImage(named:"Andreas")
        }
        cell.postProfilePic.image = postImage
                
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedContent.count
    }
    
    
    // Functions to control the add new discussion modals
    @IBAction func cancelToFeedViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveNewDiscussion(segue:UIStoryboardSegue) {
        let newDiscussionDetailsViewController = segue.sourceViewController as NewDiscussionDetailsViewController
        
//        //add the new post to the post array
//        feedContent.append(newDiscussionDetailsViewController.newPost)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return feedContent.count + 1
//        }
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }

}
