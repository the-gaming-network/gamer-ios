//
//  FeedPost.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class FeedPost: NSObject {
    var userName: String
    var groupName: String
    var postContent: String
    var profileImage: NSData
    var commentCount: Int
    var upvoteCount: Int
    var postKey: Int
    
    init(userName: String, groupName: String, postContent: String, profileImage: NSData, commentCount: Int, upvoteCount: Int, postKey: Int) {
        self.userName = userName
        self.groupName = groupName
        self.postContent = postContent
        self.profileImage = profileImage
        self.commentCount = commentCount
        self.upvoteCount = upvoteCount
        self.postKey = postKey
        super.init()
    }
}

class PostData: NSObject {
    var userName: String
    var groupName: String
    var postContent: String
    var profileImage: String
    var commentCount: Int
    var upvoteCount: Int
    var postKey: Int
    
    init(userName: String, groupName: String, postContent: String, profileImage: String, commentCount: Int, upvoteCount: Int, postKey: Int) {
        self.userName = userName
        self.groupName = groupName
        self.postContent = postContent
        self.profileImage = profileImage
        self.commentCount = commentCount
        self.upvoteCount = upvoteCount
        self.postKey = postKey
        super.init()
    }
}

class CommentData: NSObject {
    var userName: String
    var commentContent: String
    var profileImage: String
    var commentKey: Int
    
    init(userName: String, commentContent: String, profileImage: String, commentKey: Int) {
        self.userName = userName
        self.commentContent = commentContent
        self.profileImage = profileImage
        self.commentKey = commentKey
        super.init()
    }
}

class UpvoteData: NSObject {
    var userName: String
    var groupName: String
    var postImage: String
    var postKey: Int
    
    init(userName: String, groupName: String, postImage: String, postKey: Int) {
        self.userName = userName
        self.groupName = groupName
        self.postImage = postImage
        self.postKey = postKey
        super.init()
    }
}