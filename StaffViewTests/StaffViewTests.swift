//
//  StaffViewTests.swift
//  StaffView
//
//  Created by James Bean on 6/28/17.
//
//

import XCTest
import Pitch
import PitchSpellingTools
import StaffModel
import StaffView

class StaffViewTests: XCTestCase {
    
    func testBuilderAPI() {
        let clefs: [Clef.Kind] = [.treble, .bass, .alto, .tenor]
        for clef in clefs {
            let builder = StaffView.Builder(clef: Clef(clef), configuration: StaffConfiguration())
            builder.startLines(at: 0)
            builder.stopLines(at: 500)
            let staffView = builder.build()
            let layer = CALayer(staffView.rendered)
            layer.frame = CGRect(x: 0, y: 0, width: 500, height: 100)
            layer.renderToPDF(name: "\(clef)_staff")
        }
    }
    
    func testInitWithModelAndConfiguration() {
        
        let pitches: [Pitch] = [60,62,63,64,66,68,71]
        let spelled = pitches.map { $0.spelledWithDefaultSpelling() }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        let points = representable.map { StaffPointModel([$0]) }
        
        var positions: [Double] = []
        var accum: Double = 100
        for _ in points.indices {
            positions.append(accum)
            accum += 100
        }
        
        let builder = StaffModel.builder
        zip(positions, points).forEach { position, point in builder.add(point, at: position) }
        let model = builder.build()
        
        let view = StaffView(model: model)
        let layer = CALayer(view.rendered)
        layer.frame = CGRect(x: 0, y: 0, width: 800, height: 300)
        layer.renderToPDF(name: "staff_pitches")
    }
    
    func testHull() {
        
        let pitches: [Pitch] = [60,62,63,64,66,68,71]
        let spelled = pitches.map { $0.spelledWithDefaultSpelling() }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        let points = representable.map { StaffPointModel([$0]) }
        
        var positions: [Double] = []
        var accum: Double = 100
        for _ in points.indices {
            positions.append(accum)
            accum += 100
        }
        
        let builder = StaffModel.builder
        zip(positions, points).forEach { position, point in builder.add(point, at: position) }
        let model = builder.build()
        
        let view = StaffView(model: model)
        let composite = view.rendered
        
    }
}
