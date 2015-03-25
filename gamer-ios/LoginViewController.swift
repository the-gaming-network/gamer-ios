//
//  LoginViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/11/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//
import UIKit

class LoginViewController: UIViewController, FBLoginViewDelegate {
    
    @IBOutlet var fbLoginView: FBLoginView!
    var net: Net!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        net = Net(baseUrlString: "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/")
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
        println("User Email: \(user)")
        var myToken = FBSession.activeSession().accessTokenData.accessToken

        let fbUrl = "rest-auth/facebook/"
        let fbParams = ["access_token": myToken]
        println(fbParams)
        net.POST(fbUrl, params: fbParams, successHandler: { responseData in
            let result = responseData.json(error: nil)
            NSLog("result: \(result)")
            }, failureHandler: { error in
                NSLog("Error")
        })
        
//        let postUrl = "api/posts/"
//        let postParams = ["owner": 1, "text": "I'm a big fan of this game", "group": 1]
//        println(postParams)
//        net.POST(postUrl, params: postParams, successHandler: { responseData in
//            let result = responseData.json(error: nil)
//            NSLog("result: \(result)")
//            }, failureHandler: { error in
//                NSLog("Error")
//        })
        
//        let loginUrl = "rest-auth/login/"
//        var loginParams = ["username":"ianjsikora", "password":"icowQfEqjHV7uqDVRLj2"] as Dictionary
//        net.POST(loginUrl, params: loginParams, successHandler: { responseData in
//            let result = responseData.json(error: nil)
//            NSLog("result: \(result)")
//            }, failureHandler: { error in
//                NSLog("Error")
//        })
        
//        func login() -> Void {
//            var session = NSURLSession.sharedSession()
//            var request = NSMutableURLRequest(URL: NSURL(string: "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/api/posts/")!)
//            request.HTTPMethod = "POST"
//            var params = ["username":"ianjsikora", "password":"icowQfEqjHV7uqDVRLj2"]
//            
//            request.HTTPBody = params
//            request.addValue("text/html", forHTTPHeaderField: "Content-Type")
//            
//            var task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) -> Void in
//                println("Response: \(response)")
//                println("Data: \(NSString(data: data, encoding: NSUTF8StringEncoding)))")
//                let httpResponse = response as NSHTTPURLResponse
//                var cookie = httpResponse.allHeaderFields["Set-Cookie"] as String
//            })
//            task.resume()
//        }
//        login()
        
//        let userName = "ianjsikora"
//        let password = "icowQfEqjHV7uqDVRLj2"
       
//        let loginUrl = "rest-auth/login/"
//        let loginParams = ["username": userName, "password": password]
//        println(loginParams)

//        net.POST(loginUrl, params: loginParams, successHandler: { responseData in
//            let result = responseData.json(error: nil)
//            NSLog("result: \(result)")
//            }, failureHandler: { error in
//                NSLog("Error")
//        })
        
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
