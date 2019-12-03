//
//  ConfirmViewController.swift
//  Agenda
//
//  Created by Trinidad Garcia on 21/06/18.
//  Copyright © 2018 Trinidad Garcia. All rights reserved.
//

import UIKit
import CoreData


class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblContactSaved: UILabel!
    
    var nombre = "Nombre no valido"
    var apellido = "Apellido no valido"
    var telefono = "Telefono no valido"
    var correo = "Correo no valido"
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblFirstName.text = nombre
        lblLastName.text = apellido
        lblPhone.text = telefono
        lblEmail.text = correo
    }

    
    @IBAction func btnSaveContact(_ sender: Any) {
        if lblFirstName?.text != "" && lblLastName?.text != "" && lblPhone?.text != "" && lblEmail?.text != ""{
            let newUser = NSEntityDescription.insertNewObject(forEntityName:"Contact", into:context)
            newUser.setValue(self.lblFirstName!.text, forKey: "firstNameContact")
            newUser.setValue(self.lblLastName!.text, forKey: "lastNameContact")
            newUser.setValue(self.lblPhone!.text, forKey: "phoneContact")
            newUser.setValue(self.lblEmail!.text, forKey: "emailContact")
            do{
                try context.save()
                lblContactSaved?.text = "Contacto salvado"
                
            } catch {
                print(error)
            }
            
        } else {
            print("Please fill the fields")
        }
        
    }
}
