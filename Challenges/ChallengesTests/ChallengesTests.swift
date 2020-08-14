//
//  ChallengesTests.swift
//  ChallengesTests
//
//  Created by Michael McGrath on 8/7/20.
//  Copyright © 2020 Michael McGrath. All rights reserved.
//

import XCTest
@testable import Challenges

class ChallengesTests: XCTestCase {
    
    /*
    Given two strings, find the number of common characters between them.

    Example

    For s1 = "aabcc" and s2 = "adcaa", the output should be
    commonCharacterCount(s1, s2) = 3.

    Strings have 3 common characters - 2 "a"s and 1 "c".

    Input/Output

    [execution time limit] 20 seconds (swift)

    [input] string s1

    A string consisting of lowercase English letters.

    Guaranteed constraints:
    1 ≤ s1.length < 15.

    [input] string s2

    A string consisting of lowercase English letters.

    Guaranteed constraints:
    1 ≤ s2.length < 15.

    [output] integer
    */
    
    func commonCharacterCount(s1: String, s2: String) -> Int {
        var countedSet = Dictionary<Character, Int>()
        var count = 0
        s1.forEach { countedSet[$0, default: 0] += 1 }
        s2.forEach { character in
            if countedSet.keys.contains(character) && countedSet[character]! != 0 {
                countedSet[character]! -= 1
                count += 1
            }
        }
        return count
    }

    func testOne() throws {
        let x = commonCharacterCount(s1: "aabcc", s2: "adcaa")
        XCTAssertEqual(x, 3)
    }

    func testTwo() throws {
        let x = commonCharacterCount(s1: "zzzz", s2: "zzzzzzz")
        XCTAssertEqual(x, 4)
    }
    
    func testThree() throws {
        let x = commonCharacterCount(s1: "abca", s2: "xyzbac")
        XCTAssertEqual(x, 3)
    }
    
    func testFour() throws {
        let x = commonCharacterCount(s1: "a", s2: "b")
        XCTAssertEqual(x, 0)
    }
    
    func testFive() throws {
        let x = commonCharacterCount(s1: "a", s2: "aaa")
        XCTAssertEqual(x, 1)
    }
    
    func testSix() throws {
        let x = commonCharacterCount(s1: "qlyhsidkensldfhqhdlsqdklsduq", s2: "qwertyqwertqq")
        XCTAssertEqual(x, 6)
    }
    
    func testSeven() throws {
        let x = commonCharacterCount(s1: "z" , s2: String(repeating: "z", count: 100000))
        XCTAssertEqual(x, 1)
    }
    
    func testPerformanceExample() throws {
        self.measure {
            try! testOne()
            try! testTwo()
            try! testThree()
            try! testFour()
            try! testFive()
            try! testSix()
            try! testSeven()
        }
    }
}
