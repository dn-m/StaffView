//
//  ClefTests.swift
//  StaffView
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import ArithmeticTools
import GeometryTools
import PathTools
import GraphicsTools
import PlotModel
import PlotView
import StaffView

class ClefTests: XCTestCase {
    
    func testClefs() {
        let position = VerticalAxisPosition(x: 0, plotTop: 0, plotBottom: 40)
        let configuration = ClefConfiguration(foregroundColor: .darkRed, maskColor: .white)
        let c = StaffClefView.makeClef(.treble, position: position, configuration: configuration)
    }
}
