//
//  NoteheadTests.swift
//  StaffView
//
//  Created by James Bean on 6/4/17.
//
//

import XCTest
import GeometryTools
import PathTools
import StaffView

class NoteheadTests: XCTestCase {
    
    func testNoteheadPDF() {
        let notehead = NoteheadView(point: Point(), staffSlotHeight: 12)
        let layer = CALayer(notehead.rendered)
        layer.showTestBorder()
        layer.renderToPDF(name: "notehead")
    }
}
