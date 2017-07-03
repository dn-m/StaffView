//
//  AccidentalTests.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import XCTest
import StaffModel
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
        let accidental = Natural(position: Point(x: 0, y: 0))
        let layer = CALayer(accidental.rendered)
        layer.showTestBorder()
        layer.renderToPDF(name: "accidental_natural")
    }
    
    func testSharp() {
        let accidental = Sharp(position: Point(x: 0, y: 0))
        let layer = CALayer(accidental.rendered)
        layer.showTestBorder()
        layer.renderToPDF(name: "accidental_sharp")
    }
    
    func testFlat() {
        let accidental = Flat(position: Point(x: 0, y: 0))
        let layer = CALayer(accidental.rendered)
        layer.showTestBorder()
        layer.renderToPDF(name: "accidental_flat")
    }

    func testInContext() {

        let frame = Rectangle(x: 0, y: 0, width: 100, height: 100)
        let accidental = Natural(position: frame.center)
        let composite = accidental.rendered

        let resizedComposite = composite
        let layer = CALayer(resizedComposite)
        layer.showTestBorder()

        let container = CALayer()
        container.frame = CGRect(frame)
        container.addSublayer(layer)
        container.renderToPDF(name: "accidental_in_context")
    }
}

extension CALayer {

    public convenience init(_ composite: StyledPath.Composite) {

        func traverse(_ composite: StyledPath.Composite, building container: CALayer) {
            switch composite {
            case .leaf(let styledPath):
                let layer = CAShapeLayer(styledPath)
                container.addSublayer(layer)
            case .branch(let group, let trees):
                let layer = CALayer()
                layer.frame = CGRect(group.frame)
                trees.forEach { traverse($0, building: layer) }
                container.addSublayer(layer)
            }
        }

        self.init()
        self.frame = CGRect(composite.frame)
        traverse(composite.resizedToFitContents, building: self)
    }
}

