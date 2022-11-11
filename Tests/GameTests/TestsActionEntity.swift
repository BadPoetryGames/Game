//
//  TestsActionEntity.swift
//  Game Package Tests
//
//  Created by James Lingo on 11/10/22.
//

import XCTest
import TestTools
@testable import Game

final class TestsActionEntity: BaseTest {

    // MARK: - Properties
    
    var subject: ActionEntity?
    
    // MARK: - Functions
    
    // MARK: - Functions: XCTestCase

    override func setUp() {
        subject = MockActionEntity()
    }
    
    override func tearDown() {
        subject = nil
    }
    
    // MARK: - Functions: Unit Tests

    // MARK: - Functions: Unit Tests, Entity.Attributes

    func testActionEntityHasBeginAsDateAndItIsWriteableOptionalAndStartsNil() {
        XCTAssertNil(subject?.begin)
        
        let old = subject?.begin
        let new = Date()
        
        subject?.begin = new
        
        XCTAssertNotEqual(subject?.begin, old)
        XCTAssertEqual(subject?.begin, new)
    }
    
    func testActionEntityHasFinishAsDateAndItIsWriteableOptionalAndStartsNil() {
        XCTAssertNil(subject?.finish)
        
        let old = subject?.finish
        let new = Date()
        
        subject?.finish = new
        
        XCTAssertNotEqual(subject?.finish, old)
        XCTAssertEqual(subject?.finish, new)
    }
    
    func testActionEntityHasIsNPCAndItIsWriteable() {
        XCTAssertNotNil(subject?.isPlayer)
        
        guard let old = subject?.isPlayer else { return XCTFail() }
        
        let new = !old
        
        subject?.isPlayer = new
        
        XCTAssertNotEqual(subject?.isPlayer, old)
        XCTAssertEqual(subject?.isPlayer, new)
    }
    
    func testActionEntityHasRawStateAsIntegerAndItIsWriteableOptionalAndStartsNil() {
        XCTAssertNil(subject?.rawState)
        
        let old = subject?.rawState
        let new = old ?? 0 + 1
        
        subject?.rawState = new
        
        XCTAssertNotEqual(subject?.rawState, old)
        XCTAssertEqual(subject?.rawState, new)
    }
    
    // MARK: - Functions: Unit Tests, Entity.Relationships

    func testActionEntityHasCharacterAssociation() {
//        XCTAssertNotNil(subject?.character)
        XCTFail()
    }
}

struct MockActionEntity: ActionEntity {
    var finish: Date?
    var begin: Date?
    var rawState: Int?
    var isPlayer: Bool = false
}
