//
//  NewDiscussionDetailsViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class NewDiscussionDetailsViewController: UITableViewController {

    @IBOutlet var newPostContent: UITextField!
    @IBOutlet var groupTextField: UILabel!
    @IBOutlet var moreOptionsLabel: UILabel!
    
    var newPost:FeedPost!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            newPostContent.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveNewDiscussion" {
            newPost = FeedPost(userName: "@ianjsikora", groupName: self.groupTextField.text!, postContent: self.newPostContent.text, postImage: "Ian", commentCount: 0, upvoteCount: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
