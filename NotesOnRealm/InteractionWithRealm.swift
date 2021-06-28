//
//  InteractionWithRealm.swift
//  NotesOnRealm
//
//  Created by Леонид on 23.06.2021.
//

import Foundation
import RealmSwift

class RealmManager {
    static var shared = RealmManager()
    
    var realm: Realm = try! Realm()
    
    func saveNote (_ createdNote: Note){
        try! realm.write({
            realm.add(createdNote)
        })
    }
    
    func takeNotesFromEntity ()->[Note]{
        return Array(realm.objects(Note.self))
    }
    
    func removeNote (_ note: Note) {
        try! realm.write({
            realm.delete(note)
        })
    }
}
