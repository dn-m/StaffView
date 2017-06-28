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
import PlotView
import StaffView

class ClefTests: XCTestCase {
    
    func testClefs() {
        let position = VerticalAxisPosition.init()
        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
        let views = clefs.forEach { kind in
            //
        }
    }
}
