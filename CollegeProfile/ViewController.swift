//
//  ViewController.swift
//  CollegeProfile
//
//  Created by nburns on 1/20/16.
//  Copyright © 2016 nburns. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var myEditButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    
    var collegeProfile : [CollegeProfileClass] = []
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    myTableView.dataSource = self
    myTableView.delegate = self
    myEditButton.tag = 0
        
        collegeProfile.append(CollegeProfileClass(CollegeName: "MIT", Location: "Cambridge, Massachusetts", Rating: 10, Image: UIImage(named: "default")!))
        
        collegeProfile.append(CollegeProfileClass(CollegeName: "Stanford University", Location: "Stanford, California", Rating: 9, Image: UIImage(named: "default")!))
        
        collegeProfile.append(CollegeProfileClass(CollegeName: "Harvard University", Location: "Cambridge, Massachusetts", Rating: 19, Image: UIImage(named: "default")!))

    
    
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        let myAlert = UIAlertController(title: "Add Colleges", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (collegeNameTextfield) -> Void in
            collegeNameTextfield.placeholder = "Add College name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationtextfield) -> Void in
            locationtextfield.placeholder = "Add Location"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeNametf = myAlert.textFields![0] as UITextField
            let locationtf = myAlert.textFields![1] as UITextField
            self.collegeProfile.append(CollegeProfileClass(CollegeName: collegeNametf.text!, Location: locationtf.text!))
            self.myTableView.reloadData()

    
    
    
    
    
    }
    myAlert.addAction(addAction)
    //presents Alert View
    self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
        {
        if myEditButton.tag == 0
        {
            myTableView.editing = true
            myEditButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            myEditButton.tag = 0
        }
    }
    
    
    
    
    
    
    
    
    //required function for tableView protocal, sendsdata to cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell
    {
        //creates a cell variable for table view
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        //state properties for cell
        myCell.textLabel!.text = collegeProfile[indexPath.row].collegeName
        myCell.detailTextLabel!.text = collegeProfile[indexPath.row].location
        return myCell
    
    }
    
    //required function for tableview, sets number of rows for table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeProfile.count
    }
    
    //allows you to delete a row and reload data
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            collegeProfile.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
        {
            return true
        }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
            let selectedCollegeProfile = collegeProfile[sourceIndexPath.row]
            collegeProfile.removeAtIndex(sourceIndexPath.row)
            collegeProfile.insert(selectedCollegeProfile, atIndex: destinationIndexPath.row)
            
        }

        
        
    
}
