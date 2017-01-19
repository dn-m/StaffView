//
//  AccidentalTests.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import XCTest
import StaffModel
import StaffView

class AccidentalTests: XCTestCase {
    
    func testPerformanceThousandAccidentals() {
        let accidental: Accidental = .natural
        
        measure {
            (0..<1000).forEach { _ in
                _ = AccidentalView.makeAccidental(
                    withKind: accidental,
                    point: CGPoint.zero,
                    staffSlotHeight: 12
                )
            }
        }
    }
}
