//
//  MinutesTests.swift
//  MinutesTests
//
//  Created by Pratibha Bhandari on 23/04/21.
//  Copyright © 2021 Microsoft. All rights reserved.
//

import XCTest
@testable import Minutes

class MinutesTests: XCTestCase {
    
    var entryUnderTests: Entry!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        entryUnderTests = Entry("Title", "Content")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        entryUnderTests = nil
        super.tearDown()
    }
    func testSerialization(){
        let serializationData = FileEntryStore.serialize(entryUnderTests)
        let entry = FileEntryStore.deserialize(serializationData!)
        
        XCTAssertEqual(entry?.title, "Title", "Title does not match")
        XCTAssertEqual(entry?.content, "Content", "Content does not match")
    }
}
