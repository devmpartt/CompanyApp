//
//  EmployeeDetailsViewController.swift
//  Company
//
//  Created by Marika on 3.11.2018.
//  Copyright © 2018 Marika. All rights reserved.
//

import UIKit

class EmployeeDetailsViewController: UITableViewController {

    var employee: Employee! = Employee()
    
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var bdate: UITextField!
    @IBOutlet weak var phone1: UITextField!
    @IBOutlet weak var phone2: UITextField!
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var depName: UILabel!
    @IBOutlet weak var depID: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fname.text = employee.fname!
        lname.text = employee.lname!
        email.text = employee.email
        bdate.text = employee.bdate
        phone1.text = employee.phone1
        phone2.text = employee.phone2
        depID.text = employee.dep
        depName.text = employee.dname
        salary.text = String(employee.salary!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "saveToEmployees" {
            self.employee.fname = self.fname.text!
            self.employee.lname = self.lname.text!
            self.employee.bdate = self.bdate.text!
            self.employee.email = self.email.text!
            self.employee.phone1 = self.phone1.text!
            self.employee.phone2 = self.phone2.text!
            self.employee.dep = self.depID.text!
            self.employee.salary = Double(self.salary.text!)
        }
        
        if segue.identifier == "updateToEmployees" {
            self.employee.fname = self.fname.text!
            self.employee.lname = self.lname.text!
            self.employee.bdate = self.bdate.text!
            self.employee.email = self.email.text!
            self.employee.phone1 = self.phone1.text!
            self.employee.phone2 = self.phone2.text!
            self.employee.dep = self.depID.text!
            self.employee.salary = Double(self.salary.text!)
        }
        
    }
    

}
