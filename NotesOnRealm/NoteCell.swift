//
//  NoteCell.swift
//  NotesOnRealm
//
//  Created by Леонид on 23.06.2021.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteNameLabel: UILabel!
    @IBOutlet weak var dateOfCreationLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
