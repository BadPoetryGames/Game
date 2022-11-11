//
//  CharacterEntity.swift
//  Game Package
//
//  Created by James Lingo on 11/10/22.
//

import Foundation


/// This protocol is an abstraction of a generic CharacterEntity type for use in all future BPG products.
protocol CharacterEntity {
    
    /// This property contains the CharacterEntity's full name.
    var name: String { get set }
    
    /// This property contains a boolean value that is true when the character is an NPC,
    /// otherwise it is false when the character is an USER.
    var isNPC: Bool { get set }
    
    /// This optional property contains the CharacterEntity's portrait image in data format.
    var portrait: Data? { get set }
    
    /// This optional property contains a raw integer that can be used to derive the CharacterEntity's state.
    var rawState: Int? { get set }
}
