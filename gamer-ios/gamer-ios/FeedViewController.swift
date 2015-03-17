//
//  FeedViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {
    
    var posts: [FeedPost] = []
    
    func loadFeedData(userID: Int) {
        let feedDataURL = "http://10.12.4.41:8000/Feed.json"
        let urlPath: String = feedDataURL
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
        >=nil
        var error: NSErrorPointer = nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError
        var feedData: NSArray = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
        let json = JSON(feedData)
        if let feedArray = json.array {
            for post in feedArray {
                var userName: String! = post["owner_name"].string
                var groupName: String! = post["group"].string
                var postContent: String! = post["text"].string
                var commentCount: Int! = post["comments"].int
                var upvoteCount: Int! = post["likes"].int
                var postImage: String! = post["image_url"].string
                var postKey: Int! = post["pk"].int
                var post = FeedPost(userName: userName!, groupName: groupName!, postContent: postContent!, postImage: postImage!, commentCount: commentCount!, upvoteCount: upvoteCount!, postKey: postKey)
                self.posts.append(post)
            }
        }
    }
    
    // Code to populate the feed
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("FeedPostCell", forIndexPath: indexPath) as FeedPostCell
            let post = self.posts[indexPath.row] as FeedPost
            
            // defining new variables in each table cell
            cell.userNameLabel.text = post.userName
            cell.groupNameLabel.text = post.groupName
            cell.postContentLabel.text = post.postContent
            cell.postCommentsLabel.text = "\(post.commentCount) comments"
            cell.postUpvotesLabel.text = "\(post.upvoteCount) upvotes"
            cell.postProfilePic.image = UIImage(named:post.postImage)
            println("cellForRowAtIndexPath \(posts)")
            return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        loadFeedData(1)
        return posts.count
    }
    
    
    // Functions to control the add new discussion modals
    @IBAction func cancelToFeedViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveNewDiscussion(segue:UIStoryboardSegue) {
        let newDiscussionDetailsViewController = segue.sourceViewController as NewDiscussionDetailsViewController
        
        // update the tableView
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
//        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        // hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }

}
