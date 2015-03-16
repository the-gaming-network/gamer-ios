//
//  DataManager.swift
//  TopApps
//
//  Created by Dani Arnaout on 9/2/14.
//  Edited by Eric Cerney on 9/27/14.
//  Copyright (c) 2014 Ray Wenderlich All rights reserved.
//

import Foundation

let feedDataURL = "http://10.12.4.41:8000/Feed.json"

class DataManager {
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        let urlPath: String = feedDataURL
        var url: NSURL = NSURL(string: urlPath)!
        var request1: NSURLRequest = NSURLRequest(URL: url)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?
        >=nil
        var error: NSErrorPointer = nil
        var dataVal: NSData =  NSURLConnection.sendSynchronousRequest(request1, returningResponse: response, error:nil)!
        var err: NSError
        var data: NSArray = NSJSONSerialization.JSONObjectWithData(dataVal, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSArray
    }
    
class func getFeedDataWithSuccess(success: ((feedData: NSData!) -> Void)) {
    loadDataFromURL(NSURL(string: feedDataURL)!, completion:{(data, error) -> Void in
        if let urlData = data {
            success(feedData: urlData)
        }
    })
  }
}