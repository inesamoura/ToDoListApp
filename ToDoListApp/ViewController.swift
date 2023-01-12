//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, ShowViewControllerDelegate {
    
    //creation des variables de base
    var valueSentFromShowViewController: UIButton?
    var cellDeleted: Bool?
    
    var currentDate: Date = Date()
    var sectionHeaderTitles = [String]()
    var sectionsToDo = [[Todo]]()
    
    //lien avec la tableView
    @IBOutlet weak var tableview: UITableView!
    
    //fonction de notre tableau
    func rowAndSectionOfElement(tag: Int) -> [Int] {
            //creation du compteur
        var compteur = 0

        let nbSections = numberOfSections(in: tableview)
        var foundSection = false
        var nbRowAndSection = [Int]()
        for i in 0...nbSections-1{
            compteur += tableView(tableview, numberOfRowsInSection: i) + 1
            if !foundSection && compteur >= tag{
                foundSection = true
                nbRowAndSection.append(i)
                nbRowAndSection.append(compteur-tag)
            }
        }
        return nbRowAndSection
    }
    
    
    func nbSectionsElements(currentSection: Int, position: Int) -> Int {
        var res = 0
        if currentSection >= 0 {
            for i in 0...currentSection{
                res += tableView(tableview, numberOfRowsInSection: i) + 1
            }
            res -= position
        }
        return res
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaderTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsToDo[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //on appelle la cellule type de notre tableau
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellContent", for: indexPath) as! TableViewCell
        
        //mise en place des cellules avec leur attribut: titre, checkBox etc
        cell.titre.text = sectionsToDo[indexPath.section][indexPath.row].getNom()
        cell.bouton.tag = nbSectionsElements(currentSection: indexPath.section, position: indexPath.row)
        cell.checkBoxValidate.tag = nbSectionsElements(currentSection: indexPath.section, position: indexPath.row)
        print("tag de l'élément : "+String(cell.checkBoxValidate.tag))
        cell.checkBoxValidate.isSelected = sectionsToDo[indexPath.section][indexPath.row].getEtatTache()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Find the row of the cell
            let row = indexPath.row
            sectionsToDo[indexPath.section].remove(at: row)
            cellDeleted = true
            valueSentFromShowViewController = nil
            tableview.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //fonction ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // cette fonction effectue toute les configurations supplémentaires après le chargement de la vue
        sectionsToDo.removeAll(keepingCapacity: true)
        
        //creation de nos sections
        sectionHeaderTitles.append("Aujourd'hui")
        sectionHeaderTitles.append("Demain")
        sectionHeaderTitles.append("Cette semaine")
        sectionHeaderTitles.append("Plus tard")
        
        let emptyrow = [Todo]()
        sectionsToDo.append(emptyrow)
        sectionsToDo.append(emptyrow)
        sectionsToDo.append(emptyrow)
        sectionsToDo.append(emptyrow)
        
        tableview.dataSource = self
        tableview.reloadData()
    }
    
    
    //On envoie les données à afficher dans la vue principale
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ShowViewController {
            vc.delegate = self
            let row = tableview.indexPathForSelectedRow!.row
            let section = tableview.indexPathForSelectedRow!.section
            
            vc.data = sectionsToDo[section][row]
            vc.indiceData = nbSectionsElements(currentSection: section, position: row)
            cellDeleted = false
        }
        
    }
    
    /*
     Fonction appelée lorsque l'on retourne sur cette vue à partir d'un bouton (autre qu'un bouton de navigation)
     présent sur le CreationViewController.
     */
    @IBAction func backToMainView(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "ajouterTache" {
            
            // On souhaite ajouter une nouvelle tâche dans notre liste
            let ajouterViewController = unwindSegue.source as! CreationViewController
            let titre = ajouterViewController.titleToAdd.text!
            let desc = ajouterViewController.descToAdd.text!
            let dateReal = ajouterViewController.dateRealToAdd.date
            let newTodo = Todo(nom: titre, description: desc, date: dateReal)
            
            let dateElement =  newTodo.getDateReal()
            let tomorrow = addOrSubstrateDays(date: currentDate, nb: 1)
            let weekLater = addOrSubstrateDays(date: currentDate, nb: 7)
            
            if Calendar.current.compare(dateElement, to: currentDate, toGranularity: .day) == .orderedSame{
                sectionsToDo[0].append(newTodo)
            }else if Calendar.current.compare(dateElement, to: tomorrow, toGranularity: .day) == .orderedSame{
                sectionsToDo[1].append(newTodo)
            }else if Calendar.current.compare(dateElement, to: weekLater, toGranularity: .day) == .orderedSame || Calendar.current.compare(dateElement, to: weekLater, toGranularity: .day) == .orderedAscending{
                sectionsToDo[2].append(newTodo)
            }else {
                sectionsToDo[3].append(newTodo)
            }
            
            print(sectionsToDo)
            tableview.reloadData()
        }
        
        // On souhaite supprimer une tâche de notre liste
        if unwindSegue.identifier == "supprimerTache" {
            let showViewController = unwindSegue.source as! ShowViewController
            print("Tag : "+String(showViewController.indiceData))
            let indices = rowAndSectionOfElement(tag: showViewController.indiceData!)
            sectionsToDo[indices[0]].remove(at: indices[1])
            cellDeleted = true
            valueSentFromShowViewController = nil
            
            tableview.reloadData()
        }
    }
    
    //lien avec nos boutons
    @IBAction func validateToDo(_ sender: UIButton) {
        let indices = rowAndSectionOfElement(tag: sender.tag)
        sectionsToDo[indices[0]].remove(at: indices[1])
        cellDeleted = true
        valueSentFromShowViewController = nil
        tableview.reloadData()
    }
    
    
    @IBAction func checkBoxTapped(_ sender: UIButton) {
        let indices = rowAndSectionOfElement(tag: sender.tag)
        if sender.isSelected {
            sender.isSelected = false
            sectionsToDo[indices[0]][indices[1]].setEtatTache(etat: false)
            tableview.reloadData()
        } else {
            sender.isSelected = true
            sectionsToDo[indices[0]][indices[1]].setEtatTache(etat: true)
            tableview.reloadData()
        }
    }
    
    //fonction qui se lance lorsque l'écran apparait
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let valueToDisplay = valueSentFromShowViewController
        if valueToDisplay != nil{
            print("Tag valuetoDsiaplay: "+String(valueToDisplay!.tag))
            let indices = rowAndSectionOfElement(tag: valueToDisplay!.tag)
            sectionsToDo[indices[0]][indices[1]].setEtatTache(etat: valueToDisplay!.isSelected)
        }
        
        tableview.reloadData()
        
    }
    
    /*
     Enregistre dans une variable la checkbox de la vue enfant (ShowViewController) pour que lorsque l'écran apparait (fonction viewWillAppear), on change l'état de la checkbox de la vue parente (cette vue ci) pour que leur état corresponde entre eux
     */
    func changeValueCheckBox(_ valueToChange: UIButton) {
        if !cellDeleted!{ // Uniquement si nous ne venons pas d'effectuer une supression de cellule
            self.valueSentFromShowViewController = valueToChange
        }
    }
    
    func addOrSubstrateDays(date: Date, nb: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: nb, to: date)!
    }
    
}

