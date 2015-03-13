//
//  FeedPost.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

//import Foundation
//
//class FeedPost
//{
//    let userName:String?
//    let groupName:String?
//    let profilePic:String?
//    let timestamp:String?
//    let postContent:String?
//    let commentCount:Int?
//    let upvoteCount:Int?
//    
//    init(dictionary:NSDictionary) {
//        userName        = dictionary["owner_name"]  as? String
//        groupName       = dictionary["group"]       as? String
//        profilePic      = dictionary["image_url"]   as? String
//        timestamp       = dictionary["timestamp"]   as? String
//        postContent     = dictionary["text"]        as? String
//        commentCount    = dictionary["comments"]    as? Int
//        upvoteCount     = dictionary["likes"]       as? Int
//    
//    func loadFeedFromFile(path:String) -> [FeedPost]
//    {
//        var posts:[FeedPost] = []
//        
//        var error:NSError? = nil
//        if let data = NSData(contentsOfFile: path, options: nil, error: &error) {
//            if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&error) as? NSDictionary {
//                if let team = json as? NSArray {
//                    for obj:AnyObject in team {
//                        let memberDictionary = obj as NSDictionary
//                        let post = FeedPost(dictionary: memberDictionary)
//                        posts.append(post)
//                    }
//                }
//            }
//        }
//        return members
//    }
//}
//
//
//
//
//
//
//
//
//
//


import UIKit

class FeedPost: NSObject {
    var userName: String
    var groupName: String
    var postContent: String
    var commentCount: Int
    var upvoteCount: Int
    
    init(userName: String, groupName: String, postContent: String, commentCount: Int, upvoteCount: Int) {
        self.userName = userName
        self.groupName = groupName
        self.postContent = postContent
        self.commentCount = commentCount
        self.upvoteCount = upvoteCount
        super.init()
    }
}