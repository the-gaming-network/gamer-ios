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
    
    init(userName: String, groupName: String, postContent: String) {
        self.userName = userName
        self.groupName = groupName
        self.postContent = postContent
        super.init()
    }
}