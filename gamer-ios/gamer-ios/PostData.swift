//
//  FeedPost.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/12/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class PostData: NSObject {
    var userName: String
    var groupName: String
    var postContent: String
    var postImage: String
    var commentCount: Int
    var upvoteCount: Int
    var postKey: Int
    
    init(userName: String, groupName: String, postContent: String, postImage: String, commentCount: Int, upvoteCount: Int, postKey: Int) {
        self.userName = userName
        self.groupName = groupName
        self.postContent = postContent
        self.postImage = postImage
        self.commentCount = commentCount
        self.upvoteCount = upvoteCount
        self.postKey = postKey
        super.init()
    }
}