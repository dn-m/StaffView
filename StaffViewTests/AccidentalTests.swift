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
                _ = AccidentalView.makeAccidental(accidental,
                    at: CGPoint.zero,
                    staffSlotHeight: 12
                )
            }
        }
    }
    
    func testPrintToPDF() {
        let accidental = AccidentalView.makeAccidental(.sharp, at: .zero, staffSlotHeight: 40)
        accidental.showTestBorder()
        print("accidental frame: \(accidental.frame)")
        
        accidental.renderToPDF(name: "sharp")
    }
}
