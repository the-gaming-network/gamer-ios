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
    
    var group:String = "Select Group"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTextField.text = group
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            newPostContent.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveNewDiscussion" {
            let net = Net(baseUrlString: "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/")
            let url = "api/posts/"
            let params = ["owner": 1, "text": newPostContent.text, "group":self.groupTextField.text!]
            println(params)
            net.POST(url, params: params, successHandler: { responseData in
                let result = responseData.json(error: nil)
                NSLog("result: \(result)")
                }, failureHandler: { error in
                    NSLog("Error")
            })
        }
    }
    
    @IBAction func selectedGroup(segue:UIStoryboardSegue) {
        let newDiscussionGroupPickerViewController = segue.sourceViewController as NewDiscussionGroupPickerViewController
        if let selectedGroup = newDiscussionGroupPickerViewController.selectedGroup {
            groupTextField.text = selectedGroup
            group = selectedGroup
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
