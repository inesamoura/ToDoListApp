//
//  ShowViewController.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import UIKit

/*
 Ce Delegate va permettre de lier les checkbox de cette classe avec la classe parente ViewController
 Nous sommes obligé de passer par un delegate pour faire la liaison étant donné que le bouton permettant de
 revenir à l'écran précédent n'a aucun évènement pour transmettre cette information autrement.
 */

//ajout du protocole de base
protocol ShowViewControllerDelegate : AnyObject {
    func changeValueCheckBox(_ valueToChange: UIButton)
}

class ShowViewController: UIViewController {
    
    //creation de nos variables de base
    var data: Todo?
    var indiceData: Int!
    
    //lien avec les differents label bouton et le date picker
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var dateReal: UIDatePicker!
    weak var delegate: ShowViewControllerDelegate?
    
    
    //Cette fonction change l'état de notre checkbox quand on clique dessus (activé/désactivé).
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    
    //cette fonction sort de la vue
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isMovingFromParent { //Lorsque l'on retourne à l'écran parent
            delegate?.changeValueCheckBox(checkbox) // On appelle la fonction déninie dans notre protocol
        }
    }
    
    //fonction view did load de base
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = data {
            titre.text = toDo.getNom()
            desc.text = toDo.getDescription()
            checkbox.isSelected = toDo.getEtatTache()
            dateReal.date =  toDo.getDateReal()
        }else{
            titre.text = "ERROR"
            desc.text = "ERROR"
            checkbox.isSelected = false
            dateReal.date = Date()
        }
        
        checkbox.tag = indiceData
        
        
        // ca effectue toute configuration supplémentaire après le chargement de la vue.
    }
}
