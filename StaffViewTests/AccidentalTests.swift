//
//  AccidentalTests.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import XCTest
import GeometryTools
import PathTools
import GraphicsTools
import StaffView

class AccidentalTests: XCTestCase {

    func testHole() {
        let outside = Path.square(center: Point(), width: 10)
        let inside = Path.square(center: Point(), width: 8)
        let path = outside + inside
        let styledPath = StyledPath(path: path, styling: Styling(fill: Fill(rule: .evenOdd)))
        let layer = CAShapeLayer(styledPath)
        layer.renderToPDF(name: "hole")
    }
    
    func testNatural() {
        let frame = Rectangle(x: 0, y: 0, width: 20, height: 20)
        let accidental = Natural(position: Point(x: frame.midX, y: frame.midY))
        let container = CALayer()
        let layer = CALayer(accidental.rendered)
        container.addSublayer(layer)
        container.frame = CGRect(frame)
        container.renderToPDF(name: "accidental_natural")
    }
    
    func testSharp() {
        let frame = Rectangle(x: 0, y: 0, width: 20, height: 20)
        let accidental = Sharp(position: Point(x: frame.midX, y: frame.midY))
        let container = CALayer()
        let layer = CALayer(accidental.rendered)
        container.addSublayer(layer)
        container.frame = CGRect(frame)
        container.renderToPDF(name: "accidental_sharp")
    }
    
    func testFlat() {
        let frame = Rectangle(x: 0, y: 0, width: 20, height: 20)
        let accidental = Flat(position: Point(x: frame.midX, y: frame.midY))
        let container = CALayer()
        let layer = CALayer(accidental.rendered)
        layer.showTestBorder()
        container.addSublayer(layer)
        container.frame = CGRect(frame)
        container.renderToPDF(name: "accidental_flat")
    }
}
