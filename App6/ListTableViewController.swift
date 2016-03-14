//
//  ListTableViewController.swift
//  App5
//
//  Created by Kipras on 3/6/16.
//  Copyright © 2016 Kipras. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 43
        self.tableView.rowHeight = UITableViewAutomaticDimension
        navigationItem.leftBarButtonItem = editButtonItem()
        self.tableView.reloadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Declaring variables.
    var cellEditIndex: NSIndexPath!
    

    // Sets number of sections in a cell.
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // Figures out the number of rows.
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TodoManager.sharedInstance.lists.count
    }

    // Creates cell.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ListTableViewCell"
        let cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ListTableViewCell
        cell.listTextView.text = TodoManager.sharedInstance.lists[indexPath.row].name
        cell.listImageView.image = TodoManager.sharedInstance.lists[indexPath.row].image
        cell.numberOfTasks.text = String(TodoManager.sharedInstance.lists[indexPath.row].items.count)
        // Disables scrolling.
        cell.listTextView.scrollEnabled = false
        // Disables textView editing.
        cell.listTextView.editable = false
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    /*// Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            userListInput.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            saveLists()
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }*/
    
    // Creates edit and delete button in row action.
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // When delete button is pressed, deletes list from array and deletes row
        let deleteClosure = { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            TodoManager.sharedInstance.lists.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            //self.saveLists()
        }
        // When edit button is pressed, brings out Edit/Create scene.
        let editClosure = { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            self.cellEditIndex = indexPath
            tableView.setEditing(false, animated: true)
            self.performSegueWithIdentifier("editList", sender: self)
        }
        // Buttons for delete and edit in row action.
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: deleteClosure)
        let editAction = UITableViewRowAction(style: .Normal, title: "Edit", handler: editClosure)
        return [deleteAction, editAction]
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // Prepares elements array to be sent to Elements scene.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editList" {
            let passing = segue.destinationViewController as! CreateEditViewController
            passing.indexPath = cellEditIndex
            }
        else if segue.identifier == "addList" {
            print("Adding new list.")
        }
        else if segue.identifier == "showElements" {
            let passing = segue.destinationViewController as! ElementViewController
            if let selectedListCell = sender as? ListTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedListCell)!
                passing.indexPathList = indexPath
            }
        }
    }
    
    @IBAction func unwindToCreateEditViewController(sender: UIStoryboardSegue) {
            // Update an existing list.
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                cellEditIndex = nil
            }
            // Add new list.
            else {
                self.tableView.reloadData()
            }
    }
    
    override func viewDidAppear(animated: Bool){
        self.tableView.reloadData()
    }
}