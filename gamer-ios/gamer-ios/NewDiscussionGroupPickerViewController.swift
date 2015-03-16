//
//  NewDiscussionGroupPickerViewController.swift
//  gamer-ios
//
//  Created by Ian Sikora on 3/16/15.
//  Copyright (c) 2015 rocketu. All rights reserved.
//

import UIKit

class NewDiscussionGroupPickerViewController: UITableViewController {

    var groups:[String]!
    var selectedGroup:String? = nil
    var selectedGroupIndex:Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = [
            "Small Worlds SF",
            "Riskey Business",
            "Avalon Lovers",
            "Spin the Bottle",
            "Texas Hold'em Poker",
            "Tic-Tac-Toe"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = groups[indexPath.row]
        
        if indexPath.row == selectedGroupIndex {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //Other row is selected - need to deselect it
        if let index = selectedGroupIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: index, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedGroupIndex = indexPath.row
        selectedGroup = groups[indexPath.row]
        
        //update the checkmark for the current row
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveSelectedGroup" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            selectedGroupIndex = indexPath?.row
            if let index = selectedGroupIndex {
                selectedGroup = groups[index]
                println(selectedGroup)
            }
        }
    }

}
