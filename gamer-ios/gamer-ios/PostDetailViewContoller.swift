//
//  PostDetailViewContoller.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/19/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class PostDetailViewContoller: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var postUserName: UILabel!
    @IBOutlet var postContent: UILabel!
    @IBOutlet var postProfileImage: UIImageView!
    @IBOutlet var postTimeStamp: UILabel!
    @IBOutlet var postUpvoteCount: UILabel!
    
    
    var comments: [CommentData] = []
    var commentView: UITextView?
    var postKey = 0
    var tempUserName = ""
    var tempGroupName = ""
    var tempPostContent = ""
    var tempUpvoteCount = 0
    var tempImage = NSData(contentsOfURL: NSURL(string:"http://heintendsvictory.org/wp-content/uploads/default-avatar.png")!)
    
//    var footerView: UIView
//    var contentHeight: CGFloat = 0
//    let FOOTERHEIGHT : CGFloat = 50;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        println("================   START POST   ================")
        println("POST: viewDidLoad")
        
        /* Get Data */
        loadPostData(postKey)
        
        /* Populate Post */
        postUserName.text = tempUserName
        postContent.text = tempPostContent
        postUpvoteCount.text = String(tempUpvoteCount)
        postProfileImage.image = UIImage(data: tempImage!)
        self.navigationItem.title = "Post in \(tempGroupName)"
        
        // Code to set datasource delegate
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Setup the keyboard notifications for the comment field
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyBoardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Setup the contentInsets for comments
        self.tableView.contentInset = UIEdgeInsetsZero
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        println("POST: numberOfSectionsInTableView = 1")
        return 1
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        println("POST: numberOfRowsInSection = \(comments.count)")
        return comments.count
    
    }
    
    
     /* Code to get data */
    func loadPostData(postKey: Int) {
        
        var postKey = self.postKey
        let postDataURL = "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/api/posts/" + String(postKey)
        let url = NSURL(string: postDataURL)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            println("DATA: Request Made")
            if let postData = data {
                /* Parse Comment Data */
                let json = JSON(data: postData)
                var commentsArray = json["comments"].array!
                for comment in commentsArray {
                    var userName: String! = comment["owner_name"].string
                    var commentContent: String! = comment["text"].string
                    let image_url = NSURL(string: comment["owner_profile_image"].string!)
                    let profileImage = NSData(contentsOfURL: image_url!)
                    var commentKey: Int! = comment["pk"].int
                    var commentData = CommentData(userName: userName!, commentContent: commentContent!, profileImage: profileImage!, commentKey: commentKey!)
                    self.comments.append(commentData)
                }
                
                /* Reload Comment Table */
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    println("POST: Table Reloaded")
                })
            }
        }
        task.resume()
    }
    
    /* Populate Comment Data */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCellWithIdentifier("CommentCell", forIndexPath: indexPath) as CommentTableView
            let comment = comments[indexPath.row] as CommentData
            
            /* Defining new values in each table cell */
            cell.commentUserName.text = comment.userName
            cell.commentContent.text = comment.commentContent
            cell.commentProfilePicture.image = UIImage(data:comment.profileImage)
            
            return cell
    }
    
    override func didReceiveMemoryWarning() {
        
        println("MEMORY WARNING")
        super.didReceiveMemoryWarning()
        
    }
}



//    func keyBoardWillShow(notification: NSNotification) {
//        var info:NSDictionary = notification.userInfo!
//        var keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as NSValue).CGRectValue()
//
//        var keyboardHeight:CGFloat =  keyboardSize.height - 40
//
//        var animationDuration:CGFloat = info[UIKeyboardAnimationDurationUserInfoKey] as CGFloat
//
//        var contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardHeight, 0.0);
//        self.tableView.contentInset = contentInsets
//        self.tableView.scrollIndicatorInsets = contentInsets
//
//    }
//
//    func keyBoardWillHide(notification: NSNotification) {
//
//        self.tableView.contentInset = UIEdgeInsetsZero
//        self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero
//    }


//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if self.footerView != nil {
//            return self.footerView!.bounds.height
//        }
//        return FOOTERHEIGHT
//    }


//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
////        footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: FOOTERHEIGHT))
////        footerView.backgroundColor = UIColor(red: 243.0/255, green: 243.0/255, blue: 243.0/255, alpha: 1)
//        commentView = UITextView(frame: CGRect(x: 10, y: 5, width: tableView.bounds.width - 80 , height: 40))
//        commentView?.backgroundColor = UIColor.whiteColor()
//        commentView?.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5)
//        commentView?.layer.cornerRadius = 2
//        commentView?.scrollsToTop = true
//
////        footerView.addSubview(commentView!)
//        let button = UIButton(frame: CGRect(x: tableView.bounds.width - 65, y: 10, width: 60 , height: 30))
//        button.setTitle("Comment", forState: UIControlState.Normal)
//        button.backgroundColor = UIColor(red: 155.0/255, green: 189.0/255, blue: 113.0/255, alpha: 1)
//        button.layer.cornerRadius = 5
//        button.addTarget(self, action: "comment", forControlEvents: UIControlEvents.TouchUpInside)
//        footerView.addSubview(button)
//        commentView?.delegate = self
//        return footerView
//    }

//    func textViewDidChange(textView: UITextView) {
//
//
//        if (contentHeight == 0) {
//            contentHeight = commentView!.contentSize.height
//        }
//
//        if(commentView!.contentSize.height != contentHeight && commentView!.contentSize.height > footerView.bounds.height) {
//            UIView.animateWithDuration(0.2, animations: { () -> Void in
//                let myview = self.footerView
//                println(self.commentView!.contentSize.height)
//                println(self.commentView?.font.lineHeight)
//                let newHeight : CGFloat = self.commentView!.font.lineHeight
//                let myFrame = CGRect(x: myview.frame.minX, y: myview.frame.minY - newHeight , width: myview.bounds.width, height: newHeight + myview.bounds.height)
//                myview.frame = myFrame
//
//                let mycommview = self.commentView
//                let newCommHeight : CGFloat = self.commentView!.contentSize.height
//                let myCommFrame = CGRect(x: mycommview!.frame.minX, y: mycommview!.frame.minY, width: mycommview!.bounds.width, height: newCommHeight)
//                mycommview?.frame = myCommFrame
//
//                self.commentView = mycommview
//                self.footerView  = myview
//
//                for item in self.footerView.subviews {
//                    if(item.isKindOfClass(UIButton.self)){
//                        let button = item as UIButton
//                        let newY = self.footerView.bounds.height / 2 - button.bounds.height / 2
//                        let buttonFrame = CGRect(x: button.frame.minX, y: newY , width: button.bounds.width, height : button.bounds.height)
//                        button.frame = buttonFrame
//
//
//                    }
//                }
//            })
//
//            println(self.footerView.frame)
//            println(self.commentView?.frame)
//            contentHeight = commentView!.contentSize.height
//        }
//
//
//    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "ViewFeedPost" {
//
//        }
//    }


