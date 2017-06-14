//
//  AccidentalTests.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import XCTest
import GeometryTools
import PathTools
import StaffModel
import StaffView

class AccidentalTests: XCTestCase {
    
    func testPerformanceThousandAccidentals() {
        let accidental: Accidental = .natural
        
        measure {
            (0..<1000).forEach { _ in
                _ = AccidentalView.makeAccidental(accidental,
                    at: Point(),
                    staffSlotHeight: 12
                )
            }
        }
    }
    
    func testPrintToPDF() {
        let accidental = AccidentalView.makeAccidental(.sharp, at: Point(), staffSlotHeight: 40)
        accidental.showTestBorder()
        accidental.renderToPDF(name: "sharp")
    }
}
