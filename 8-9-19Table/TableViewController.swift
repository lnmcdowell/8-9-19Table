//
//  TableViewController.swift
//  8-9-19Table
//
//  Created by Nathaniel Mcdowell on 8/9/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let CELL_ID = "CELL_ID"
    var data:[DataNode]? = [DataNode]()
    
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        print("rotated")
//        tableView.invalidateIntrinsicContentSize()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

          navigationItem.title = "8-9-19 Table"
        tableView.backgroundColor = .green
        
        setupData()
        tableView.register(myCell.self, forCellReuseIdentifier: CELL_ID)
        tableView.isUserInteractionEnabled = true
        tableView.isEditing = true
        print("viewDidLoad Complete")
        
        tableView.rowHeight = UITableView.automaticDimension
    
        //tableView.trailingAnchor.constraint(equalTo: UIScreen.main.bounds.width - 80, constant: 0)
    }
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 80 // or whatever number you choose
//    }
    func setupData(){
        
        data?.append(DataNode(name:"Nate",age:42,title:"Developer"))
        data?.append(DataNode(name: "Tom", age: 44, title: "Engineer"))
        data?.append(DataNode(name: "Eric", age: 52, title: "Bartender"))
        data?.append(DataNode(name: "Pam", age: 62, title: "Kitter"))
        data?.append(DataNode(name: "Sam", age: 52, title: "Model"))
        data?.append(DataNode(name: "Donna", age: 62, title: "Developer"))
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       // print("numberOfSections is 1")
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if let cnt = data {
         //   print("numberOfRows - \(cnt.count) in section# \(section)")
            return cnt.count
        }
      //  print("no rows")
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! myCell
 
         cell.data = data![indexPath.row]
       // print("cellForRowAt \(indexPath.row)")
        return cell
    }
  

  
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
   

  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 
   
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let temp = data!.remove(at: fromIndexPath.item)
        data?.insert(temp, at: to.item)
      //  print("row moved from \(fromIndexPath.row) to \(to.row)")
    }
 
  
    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
/////////////////////////////these two get rid of the delete buttons in isediting = true case/////
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    //////////////////////////////////////////////////////////////////////////////////////////////
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
