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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        let net = Net(baseUrlString: "http://ec2-52-11-124-82.us-west-2.compute.amazonaws.com/")
        let url = "rest-auth/facebook/"
        let params = ["access_token": myToken]
        println(params)
        net.POST(url, params: params, successHandler: { responseData in
            let result = responseData.json(error: nil)
            NSLog("result: \(result)")
            }, failureHandler: { error in
                NSLog("Error")
        })
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
