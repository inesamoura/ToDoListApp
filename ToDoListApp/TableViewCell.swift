//
//  TableViewCell.swift
//  ToDoListApp
//
//  Created by Ines Amoura on 07/01/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    //lien avec les differents boutons et label present dans une cellule type
    @IBOutlet weak var bouton: UIButton!
    @IBOutlet weak var checkBoxValidate: UIButton!
    @IBOutlet weak var titre: UILabel!
    
    // fonction d'initialisation
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // fonction qui configure la vue pour l'état sélectionné
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
