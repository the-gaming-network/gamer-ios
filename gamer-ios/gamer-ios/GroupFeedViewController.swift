//
//  GroupFeedViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/22/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class GroupFeedViewController: UITableViewController {
    
    var posts:[FeedPost] = []
    var selectedPostIndex:Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("=============   START GROUP FEED   =============")
        println("GROUP FEED: viewDidLoad")
        loadFeedData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println("GROUP FEED: numberOfSectionsInTableView = 1")
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("GROUP FEED: numberOfRowsInSection = \(posts.count)")
        return posts.count
    }
    
    /* Code to get data */
    func loadFeedData(){
        DataManager.getFeedDataWithSuccess{ (feedData) -> Void in
            self.posts = []
            println("GROUP FEED: API Request Returned")
            let json = JSON(data: feedData)
            if let feedArray = json.array {
                for post in feedArray {
                    
                    /* Variables for data in  */
                    var userName: String! = post["owner_name"].string
                    var groupName: String! = post["group_name"].string
                    var postContent: String! = post["text"].string
                    var commentCount: Int! = post["comment_count"].int
                    var upvoteCount: Int! = post["like_count"].int
                    let image_url = NSURL(string: post["owner_profile_image"].string!)
                    let profileImage = NSData(contentsOfURL: image_url!)
                    let date = NSDate()
                    let calendar = NSCalendar.currentCalendar()
                    let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
                    let hour = components.hour
                    let minutes = components.minute
                    
                    
                    
                    var postKey: Int! = post["pk"].int
                    var post = FeedPost(userName: userName!, groupName: groupName!, postContent: postContent!, profileImage: profileImage!, commentCount: commentCount!, upvoteCount: upvoteCount!, postKey: postKey)
                    self.posts.append(post)
                }
                println("GROUP FEED: Posts appended = \(self.posts.count)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    println("GROUP FEED: Table Reloaded")
                })
            }
        }
    }
    
    // Code to populate the feed
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("FeedPostCell", forIndexPath: indexPath) as FeedPostCell
            let post = posts[indexPath.row] as FeedPost
            
            /* Defining new values in each table cell */
            cell.userNameLabel.text = post.userName
            cell.groupNameLabel.text = post.groupName
            cell.postContentLabel.text = post.postContent
            cell.postCommentsLabel.text = "\(post.commentCount) comments"
            cell.postUpvotesLabel.text = "\(post.upvoteCount) upvotes"
            cell.postProfilePic.image = UIImage(data:post.profileImage)
            println("FEED: Cell \(indexPath.row) Populated")
            return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ViewFeedPost" {
            
            println("FEED: ViewFeedPost")
            
            /* Prepare for segue */
            let postDetailViewController = segue.destinationViewController as PostDetailViewContoller
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedPostIndex = indexPath?.row
            println(selectedPostIndex)
            let post = posts[selectedPostIndex!] as FeedPost
            
            /* Pass data to next page */
            if let index = selectedPostIndex {
                
                postDetailViewController.postKey = post.postKey
                postDetailViewController.tempUserName = post.userName
                postDetailViewController.tempPostContent = post.postContent
                postDetailViewController.tempGroupName = post.groupName
                postDetailViewController.tempUpvoteCount = post.upvoteCount
                postDetailViewController.tempImage = post.profileImage
                
            }
        }
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
