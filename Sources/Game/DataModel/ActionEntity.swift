//
//  ActionEntity.swift
//  Game Package
//
//  Created by James Lingo on 11/11/22.
//

import Foundation
import CoreData

protocol ActionEntity {
    
    /// This property contains a boolean value that is false when the character is an NPC,
    /// otherwise it is true when the character is an USER.
    var isPlayer: Bool { get set }
    
    /// This optional property contains a raw integer that can be used to derive the CharacterEntity's state.
    var rawState: Int? { get set }
    
    /// This optional property
    var begin: Date? { get set }
    
    var finish: Date? { get set }
}

//extension ActionEntity {
//
//    var context: NSManagedObjectContext {
//        GamePersistence.manager.viewContext
//    }
//
//    var character: Character {
//        let character =
//
//        return character
//    }
//}
