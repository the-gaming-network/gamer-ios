//
//  IndividualPostView.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/16/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class IndividualPostViewController: UITableViewController {

    var postData: [PostData] = []
    var commentData: [CommentData] = []
    var upvoteData: [UpvoteData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("================   START POST   ================")
        println("POST: viewDidLoad")
        loadPostData(1)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println("POST: numberOfSectionsInTableView = 2")
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("POST: numberOfRowsInSection = \(postData.count)")
        return postData.count
    }
    
    // Code to get data
    func loadPostData(postKey: Int) {
        DataManager.getPostDataWithSuccess { (postData) -> Void in
            println("POST: Request Returned")
            let json = JSON(data: postData)
            if let postArray = json.array {
                for post in postArray {
                    var postUserName: String! = post["owner_name"].string
                    var postGroupName: String! = post["group"].string
                    var postContent: String! = post["text"].string
                    var postProfileImage: String! = post["owner_profile_image"].string
                    var postKey: Int! = post["pk"].int
                    var post = PostData(userName: postUserName!, groupName: postGroupName!, postContent: postContent!, profileImage: postProfileImage!, commentCount: 0, upvoteCount: 0, postKey: postKey)
                    self.postData.append(post)
                }
                println("POST: Posts appended = \(self.postData.count)")
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    println("POST: Table Reloaded")
                })
            }
        }
    }
    
    // Code to populate the feed
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("PostCell", forIndexPath: indexPath) as FeedPostCell
            let post = self.postData[indexPath.row] as PostData
            navigationItem.title = "\(post.userName)'s Post in \(post.groupName)'"
            // defining new variables in each table cell
            cell.userNameLabel.text = post.userName
            cell.postContentLabel.text = post.postContent
            cell.postProfilePic.image = UIImage(named:post.profileImage)
            println("POST: Populate POST Cell")
            return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("MEMORY WARNING ON IndividualPostViewController")
    }
}