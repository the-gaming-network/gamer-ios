//
//  FourthViewController.swift
//  gamer-ios
//
//  Created by Leland on 3/11/15.
//  Copyright (c) 2015 gamer. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        println("initial viewDidLoad of the fourth VC")
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        println("fourth VC about to appear")
    }
    override func viewWillDisappear(animated: Bool) {
        println("fourth VC about to Disappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
