//
//  NoteModel.swift
//  NotesOnRealm
//
//  Created by Леонид on 23.06.2021.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var noteName: String = ""
    @objc dynamic var dateOfCreation: Date = Date()
    @objc dynamic var note: String = ""
    
    convenience init (_ noteName: String, _ note: String){
        self.init()
        
        self.noteName = noteName
        self.note = note
    }
}
