//
//  DataManager.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/2/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import Foundation


class DataManager {
    
    var postKey = 0
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            println("DATA: Request Made")
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        loadDataTask.resume()
    }

    class func getFeedDataWithSuccess(success: ((feedData: NSData!) -> Void)) {
        
        
        let feedDataURL = "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/api/posts"
        loadDataFromURL(NSURL(string: feedDataURL)!, completion:{(data, error) -> Void in
            if let urlData = data {
                success(feedData: urlData)
            }
        })
    }
    
    class func getPostDataWithSuccess( success: ((postData: NSData!) -> Void)) {
        let postDataURL = "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/api/posts/"
        loadDataFromURL(NSURL(string: postDataURL)!, completion:{(data, error) -> Void in
            if let urlData = data {
                success(postData: urlData)
            }
        })
    }
    
    class func getGroupsDataWithSuccess(success: ((groupsData: NSData!) -> Void)) {
        let groupsDataURL = "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/api/groups"
        loadDataFromURL(NSURL(string: groupsDataURL)!, completion:{(data, error) -> Void in
            if let urlData = data {
                success(groupsData: urlData)
            }
        })
    }
    
}