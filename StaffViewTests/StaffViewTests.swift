//
//  StaffViewTests.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import XCTest
import QuartzCore
import Collections
import ArithmeticTools
import Pitch
import PitchSpellingTools
import PlotModel
import StaffModel
import GeometryTools
import PathTools
import GraphicsTools
import StaffView

class StaffViewTests: XCTestCase {
    
    func testNotehead() {
        let notehead = NoteheadView(point: Point(), staffSlotHeight: 42)
        notehead.showTestBorder()
        notehead.renderToPDF(name: "notehead")
    }
    
    func testAccidentals() {
        
        let accidentals: [Accidental] = [
            .natural, .naturalUp, .naturalDown,
            .sharp, .sharpUp, .sharpDown,
            .flat, .flatUp, .flatDown
        ]
        
        for accidental in accidentals {
            let view = AccidentalView.makeAccidental(accidental, at: Point(), staffSlotHeight: 42)
            view.showTestBorder()
            view.renderToPDF(name: "accidental_\(accidental)")
        }
    }
    
//    func testMelodicCMajorTreble() {
//        let layer = CALayer()
//        layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
//        let cMajorScale: PitchCollection = [60,62,64,65,67,69,71]
//        cMajorScale.show(in: layer)
//        layer.showTestBorder()
//        layer.renderToPDF(name: "treble_c_major_melodic")
//    }
//    
//    func testMelodicCMinorTreble() {
//        let layer = CALayer()
//        layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
//        let cMajorScale: PitchCollection = [60,62,63,65,67,69,71]
//        cMajorScale.show(in: layer)
//        layer.showTestBorder()
//        layer.renderToPDF(name: "treble_c_minor_melodic")
//    }
//    
//    func testPDF() {
//        
//        var model = StaffModel(clef: Clef(.treble))
//        
//        let cMajorScale: PitchCollection = [60,62,64,65,67,69,71]
//        let sequence: [StaffRepresentablePitch] = cMajorScale.map { pitch in
//            let pitch = pitch.spelledWithDefaultSpelling()
//            let notehead: Notehead = .ord
//            return StaffRepresentablePitch.init(pitch, notehead)
//        }
//        
//        let point = StaffPointModel(sequence)
//        model.addPoint(point, at: 10)
//        
//        let layer = CALayer()
//        //layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
//        
//        let view = StaffView(model: model)
//        view.render(in: layer, with: StaffConfiguration(staffSlotHeight: 12))
//        layer.showTestBorder()
//        layer.renderToPDF(name: "staff_triad")
//    }
//
//    func testSequence() {
//        
//        // Create pitch model
//        var model = StaffModel(clef: Clef(.treble))
//        let cMajorScale: PitchCollection = [60,62,64,65,67,69,71]
//        let sequence: [StaffRepresentablePitch] = cMajorScale.map { pitch in
//            let pitch = pitch.spelledWithDefaultSpelling()
//            let notehead: Notehead = .ord
//            return StaffRepresentablePitch.init(pitch, notehead)
//        }
//        
//        var x: Double = 40
//        for note in sequence {
//            let point = StaffPointModel.init([note])
//            model.addPoint(point, at: x)
//            x += 80
//        }
//        
//        let staffView = StaffView(model: model)
//
//        let container = CALayer()
//        container.frame = CGRect(x: 0, y: 0, width: 800, height: 600)
//        staffView.render(in: container, with: StaffConfiguration(staffSlotHeight: 10))
//        container.renderToPDF(name: "pitch_sequence")
//    }
}
