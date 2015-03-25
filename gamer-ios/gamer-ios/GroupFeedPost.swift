//
//  GroupFeedPost.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/22/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class GroupFeedPost: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postContentLabel: UILabel!
    @IBOutlet weak var postCommentsLabel: UILabel!
    @IBOutlet weak var postUpvotesLabel: UILabel!
    @IBOutlet weak var postProfilePic: UIImageView!
    @IBOutlet weak var postTimeStamp: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
