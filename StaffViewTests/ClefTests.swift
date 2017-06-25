//
//  ClefTests.swift
//  StaffView
//
//  Created by James Bean on 6/25/17.
//
//

import XCTest
import GraphicsTools
import StaffModel
import StaffView

class ClefTests: XCTestCase {
    
    func testClefs() {
        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
        let views = clefs.map {
            $0.view.init(
                x: 0,
                staffTop: 0,
                staffSlotHeight: 42,
                foregroundColor: .red,
                maskColor: Color(gray: 1, alpha: 1) //Color(hex: 0xFFFFFF)
            ) as! CALayer
        }
        zip(clefs, views).forEach { clef, view in
            view.renderToPDF(name: "\(clef)")
        }
    }
}
