//
//  CreationViewController.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import UIKit

class CreationViewController: UIViewController {

    //lien avec les boutons le date picker les text view et field
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var titleToAdd: UITextField!
    @IBOutlet weak var descToAdd: UITextView!
    @IBOutlet weak var dateRealToAdd: UIDatePicker!
    
    //Ici on mets un minimum en page
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //choix des couleurs des bordures
        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        descToAdd.layer.borderWidth = 0.5
        descToAdd.layer.borderColor = borderColor.cgColor
        descToAdd.layer.cornerRadius = 5.0
        
        //choix de la largeur et autres paramètres des bordures
        buttonAdd.layer.borderWidth = 0.7
        buttonAdd.layer.borderColor = UIColor.blue.cgColor
        buttonAdd.layer.cornerRadius = 5.0
            }
    
    

}
