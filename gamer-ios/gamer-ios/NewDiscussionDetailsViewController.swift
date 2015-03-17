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
    var group:String = "Small Worlds SF"
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            newPostContent.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveNewDiscussion" {
            newPost = FeedPost(userName: "@ianjsikora", groupName: self.groupTextField.text!, postContent: self.newPostContent.text, postImage: "Ian", commentCount: 0, upvoteCount: 0, postKey: 1)
            println(newPost.groupName)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTextField.text = group
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectedGroup(segue:UIStoryboardSegue) {
        let newDiscussionGroupPickerViewController = segue.sourceViewController as NewDiscussionGroupPickerViewController
        if let selectedGroup = newDiscussionGroupPickerViewController.selectedGroup {
            groupTextField.text = selectedGroup
            group = selectedGroup
        }
    }

}
