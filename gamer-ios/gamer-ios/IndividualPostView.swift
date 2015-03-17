//
//  IndividualPostView.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/16/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class IndividualPostView: UITableViewController {

    var posts: [FeedPost] = []
    
    // Code to populate the feed
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
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
                var userName: String! = feedArray[indexPath.row]["owner_name"].string
                var groupName: String! = feedArray[indexPath.row]["group"].string
                var postContent: String! = feedArray[indexPath.row]["text"].string
                var commentCount: Int! = feedArray[indexPath.row]["comments"].int
                var upvoteCount: Int! = feedArray[indexPath.row]["likes"].int
                var postImage: String! = feedArray[indexPath.row]["image_url"].string
                var postKey: Int! = feedArray[indexPath.row]["pk"].int
                var post = FeedPost(userName: userName!, groupName: groupName!, postContent: postContent!, postImage: postImage!, commentCount: commentCount!, upvoteCount: upvoteCount!, postKey: postKey)
                self.posts.append(post)
            }
            
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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 5
    }

}
