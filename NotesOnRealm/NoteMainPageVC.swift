//
//  NoteMainPageVC.swift
//  NotesOnRealm
//
//  Created by Леонид on 23.06.2021.
//

import UIKit

class NoteMainPageVC: UITableViewController {

    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadNotesTV), name: NSNotification.Name(rawValue: "reloadNotesTV"), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        notes = RealmManager.shared.takeNotesFromEntity()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        cell.noteNameLabel.text = note.value(forKey: "noteName") as? String
        cell.noteLabel.text = note.value(forKey: "note") as? String
        
        let date = note.value(forKey: "dateOfCreation") as? Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        cell.dateOfCreationLabel.text = dateFormatter.string(from: date!)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        RealmManager.shared.removeNote(notes[indexPath.row])
        notes = RealmManager.shared.takeNotesFromEntity()
        self.tableView.reloadData()
    }
    
    @objc func reloadNotesTV () {
        notes = RealmManager.shared.takeNotesFromEntity()
        self.tableView.reloadData()
    }

}
