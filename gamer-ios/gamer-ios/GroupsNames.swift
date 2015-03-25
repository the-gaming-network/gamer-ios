//
//  GroupsNames.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/18/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class GroupsNames: NSObject {
    var groupName: String
    var groupKey: Int
    
    init(groupName: String, groupKey: Int) {
        self.groupName = groupName
        self.groupKey = groupKey
        super.init()
    }
}