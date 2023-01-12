//
//  Todo.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import Foundation

//class todo
class Todo: Codable {
    
    //creation des variables privées
    private var nom: String
    private var description: String
    private var tacheEffectuee: Bool
    private var dateRealisation: Date


    init(nom: String, description: String, date: Date){
        self.nom = nom
        self.description = description
        self.tacheEffectuee = false
        self.dateRealisation  = date
    }
    
    init(nom: String, description: String){
        self.nom = nom
        self.description = description
        self.tacheEffectuee = false
        self.dateRealisation  = Date()
    }
    
    //fonctions qui modifie et donne accé à l'etat (done ou non) de la tache
    func setEtatTache(etat: Bool){
        self.tacheEffectuee = etat
    }
    
    func getEtatTache() -> Bool{
        return self.tacheEffectuee
    }
    
    //fonctions qui modifie et donne accé au nom de la tache
    func setNom(nom: String){
        self.nom = nom
    }
    
    func getNom() -> String{
        return self.nom
    }
    
    //fonctions qui modifie et donne accé à la description de la tache
    func setDescription(desc: String){
        self.description = desc
    }
    
    func getDescription() -> String{
        return self.description
    }
    
    //fonctions qui modifie et donne accé à la date de la tache
    func setDateReal(date: Date){
        self.dateRealisation = date
    }
    
    func getDateReal() -> Date{
        return self.dateRealisation
    }
    
}
