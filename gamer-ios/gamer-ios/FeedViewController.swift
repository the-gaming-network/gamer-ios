//
//  FeedViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {

    @IBOutlet var feedTableView: UITableView!
    var posts:[FeedPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("================   START FEED   ================")
        println("FEED: viewDidLoad")
        loadFeedData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println("FEED: numberOfSectionsInTableView = 1")
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("FEED: numberOfRowsInSection = \(posts.count)")
        return posts.count
    }
    
    // Code to get data
    func loadFeedData(){
        DataManager.getFeedDataWithSuccess{ (feedData) -> Void in
            self.posts = []
            println("FEED: API Request Returned")
            let json = JSON(data: feedData)
            if let feedArray = json.array {
                for post in feedArray {
                    var userName: String! = post["owner_name"].string
                    var groupName: String! = post["group_name"].string
                    var postContent: String! = post["text"].string
                    var commentCount: Int! = post["comment_count"].int
                    var upvoteCount: Int! = post["like_count"].int
                    let image_url = NSURL(string: post["owner_profile_image"].string!)
                    let profileImage = NSData(contentsOfURL: image_url!)
                    var postKey: Int! = post["pk"].int
                    var post = FeedPost(userName: userName!, groupName: groupName!, postContent: postContent!, profileImage: profileImage!, commentCount: commentCount!, upvoteCount: upvoteCount!, postKey: postKey)
                    self.posts.append(post)
                }
                println("FEED: Posts appended = \(self.posts.count)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    println("FEED: Table Reloaded")
                })
            }
        }
    }
    
    // Code to populate the feed
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
            cell.postProfilePic.image = UIImage(data:post.profileImage)
            println("FEED: Cell \(indexPath.row) Populated")
            return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("MEMORY WARNING ON FeedViewController")
    }
    
    // Functions to control the add new discussion modals
    @IBAction func cancelToFeedViewController(segue:UIStoryboardSegue) {
        
    }

    @IBAction func saveNewDiscussion(segue:UIStoryboardSegue) {
        let newDiscussionDetailsViewController = segue.sourceViewController as NewDiscussionDetailsViewController
        loadFeedData()
        dismissViewControllerAnimated(true, completion: nil)
    }

}
