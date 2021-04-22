//
//  EmployeesViewController.swift
//  Company
//
//  Created by Marika on 3.11.2018.
//  Copyright © 2018 Marika. All rights reserved.
//

import UIKit

class EmployeesViewController: UITableViewController {
    var employees: [Employee] = [] // employee data

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: #selector(EmployeesViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        
        self.loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    @objc func handleRefresh(_ sender:AnyObject){
        loadData()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func loadData() -> Void {
        self.employees.removeAll()
        Employee.getEmployees { (employees) in
            self.employees = employees
            
            DispatchQueue.main.async(execute: {
                print("emp:")
                print(self.employees.count)
                self.tableView.reloadData()
            })
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.employees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeViewCell", for: indexPath) as! EmployeeViewCell

        let employee = employees[indexPath.row] as Employee
        cell.employee = employee

        return cell
    }
    
    @IBAction func doneToEmployees (_segue: UIStoryboardSegue){
        
    }
    
    
    @IBAction func saveToEmployees (_ segue: UIStoryboardSegue){
        
        if let employeeController = segue.source as? EmployeeDetailsViewController {
            Employee.createEmployee(emp: employeeController.employee, postCompleted: {(succeeded, msg) -> () in
                if succeeded {
                    self.loadData()
                }
            })
        }
        
    }
    
    @IBAction func updateToEmployees (_ segue: UIStoryboardSegue) {
        
        if let employeeUpdateController = segue.source as? EmployeeDetailsViewController {
            Employee.updateEmployee(emp: employeeUpdateController.employee, postCompleted: {(succeeded, msg) -> () in
                if succeeded {
                    self.loadData()
                }
            })
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let emp = self.employees[indexPath.row]
            
            Employee.deleteEmployee(emp: emp.id, postCompletion: { (succeeded, msg) -> () in
                print("delete emp " + msg)
                if succeeded {
                    self.employees.remove(at: indexPath.row)
                }
                //update UI
                DispatchQueue.main.async(execute: {
                    if succeeded {
                        self.tableView.deleteRows(at: [indexPath], with: .fade)
                    }
                })
                
            })
            
            
        }
    }
    

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "employeeDetail" {
        
            let cell = sender as! UITableViewCell
            let indexPath = self.tableView.indexPath(for: cell)
        
            let nav = segue.destination as! UINavigationController
            let detailEmployee = nav.topViewController as! EmployeeDetailsViewController
        
            detailEmployee.employee = self.employees[indexPath!.row]
        }
        else if segue.identifier == "newEmployee" {
            
        }
    }
    

}
