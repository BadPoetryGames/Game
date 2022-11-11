//
//  Strings.swift
//  Model Package
//
//  Created by James Lingo on 11/10/22.
//

import Foundation

struct Model {
    static let game = "Game"
    static let cloud = "iCloud.com.badpoetrygame.game.shared"
}

// TODO: Move to DataModel Package?
struct Path {
    static let model = "CoreDataModel"
    static let local = "Local"
    static let cloud = "Cloud"
}

// TODO: Move to Utilities Package
extension String {
    static let empty = ""
}
