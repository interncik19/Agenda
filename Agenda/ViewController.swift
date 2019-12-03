//
//  ViewController.swift
//  Agenda
//
//  Created by Trinidad Garcia on 21/06/18.
//  Copyright © 2018 Trinidad Garcia. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let firstName = txtFirstName?.text
        let lastName = txtLastName?.text
        let phone = txtPhone?.text
        let email = txtEmail?.text
        
        let guest = segue.destination as! ConfirmViewController
        guest.nombre = firstName!
        guest.apellido = lastName!
        guest.correo = email!
        guest.telefono = phone!
    }

    
    @IBAction func btnConfirmData(_ sender: Any) {
    }
}

