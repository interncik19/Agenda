//
//  SaveViewController.swift
//  Agenda
//
//  Created by Trinidad Garcia on 21/06/18.
//  Copyright © 2018 Trinidad Garcia. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var userArray:[Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource =  self
        self.fetchData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let name = userArray[indexPath.row]
        cell.textLabel!.text = name.firstNameContact! + " " + name.lastNameContact! + " " + name.phoneContact! + " " + name.emailContact!
        return cell
    }
    
    func fetchData(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            userArray = try context.fetch(Contact.fetchRequest())
        } catch {
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == .delete {
            let user = userArray[indexPath.row]
            context.delete(user)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                userArray = try context.fetch(Contact.fetchRequest())
            } catch {
                print(error)
            }
            tableView.reloadData()
        }
    }

}
