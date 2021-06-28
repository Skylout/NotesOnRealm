//
//  AddPageVC.swift
//  NotesOnRealm
//
//  Created by Леонид on 23.06.2021.
//

import UIKit

class AddNoteVC: UIViewController {

    @IBOutlet weak var noteNameTF: UITextField!
    @IBOutlet weak var noteTV: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.saveButton.layer.borderWidth = 1.0
        self.saveButton.layer.cornerRadius = 2.0
        self.noteNameTF.layer.cornerRadius = 2.0
        self.noteTV.layer.borderWidth = 1.0
        self.noteTV.layer.cornerRadius = 2.0
    }
    
    @IBAction func saveNote(_ sender: Any) {
        guard let noteName = noteNameTF.text, let note = noteTV.text else {
//            self.present(createAlert("Не указаны основные данные"), animated: true)
            return
        }
        let createdNote = Note(noteName, note)
        
        RealmManager.shared.saveNote(createdNote)
        
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadNotesTV"), object: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
