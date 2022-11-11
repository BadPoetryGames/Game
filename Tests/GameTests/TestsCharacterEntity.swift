//
//  TestsCharacterEntity.swift
//  Game Package Tests
//
//  Created by James Lingo on 11/10/22.
//

import XCTest
import Tests
@testable import Game

final class TestsCharacterEntity: XCTestCase {  // TODO: Sub-class BaseTest

    // MARK: - Properties

    // MARK: - Properties: Mocks

    var subject: CharacterEntity?
    
    // MARK: - Functions

    // MARK: - Functions: XCTestCase
    
    override func setUp() {
        subject = MockCharacterEntity(name: "Test Name")
    }
    
    override func tearDown() {
        subject = nil
    }

    // MARK: - Functions: Unit Tests

    // MARK: - Functions: Unit Tests, Entity.Attributes

    func testCharacterEntityHasNameAndItIsWriteable() {
        XCTAssertNotNil(subject?.name)
        
        let old = subject?.name
        let new = "New Test Name"
        
        subject?.name = new
        
        XCTAssertNotEqual(subject?.name, old)
        XCTAssertEqual(subject?.name, new)
    }
    
    func testCharacterEntityHasIsNPCAndItIsWriteable() {
        XCTAssertNotNil(subject?.isNPC)
        
        guard let old = subject?.isNPC else { return XCTFail() }
        
        let new = !old
        
        subject?.isNPC = new
        
        XCTAssertNotEqual(subject?.isNPC, old)
        XCTAssertEqual(subject?.isNPC, new)
    }
    
    func testCharacterEntityHasPortraitAndItIsWriteableOptionalAndStartsNil() {
        XCTAssertNil(subject?.portrait)
        
        let old = subject?.portrait
        let new = Data(capacity: 1)
        
        subject?.portrait = new
        
        XCTAssertNotEqual(subject?.portrait, old)
        XCTAssertEqual(subject?.portrait, new)
    }
    
    func testCharacterEntityHasRawStateAsIntegerAndItIsWriteableOptionalAndStartsNil() {
        XCTAssertNil(subject?.rawState)
        
        let old = subject?.rawState
        let new = old ?? 0 + 1
        
        subject?.rawState = new
        
        XCTAssertNotEqual(subject?.rawState, old)
        XCTAssertEqual(subject?.rawState, new)
    }
    
    // MARK: - Functions: Unit Tests, Entity.Relationships

    func testCharacterEntityHasHistoryCollection() {
        XCTFail()   // TODO: Requires ActionEntity to be defined.
    }

    func testCharacterEntityHasOptionalPiecesCollection() {
        XCTFail()   // TODO: Requires PieceEntity to be defined.
    }
    
    func testCharacterEntityHasOptionalStatsCollection() {
        XCTFail()   // TODO: Requires StatsEntity to be defined.
    }
}

struct MockCharacterEntity: CharacterEntity {
    var rawState: Int?
    var portrait: Data?
    var isNPC: Bool = false
    var name: String
}

