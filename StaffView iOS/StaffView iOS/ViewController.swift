//
//  ViewController.swift
//  StaffView iOS
//
//  Created by James Bean on 1/18/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import UIKit
import Pitch
import PitchSpellingTools
import StaffModel
import StaffView
import GraphicsTools

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        let layer = CALayer()
        layer.frame = CGRect(x: 0, y: 0, width: 800, height: 200)
        let cMajorScale: PitchCollection = [60,62,64,65,67,69,71]
        cMajorScale.show(in: layer)
        layer.showTestBorder()
        view.layer.addSublayer(layer)
        
//        var x: CGFloat = 10
//        (0..<1_000).forEach { _ in
//            let accidental = Accidental.flat
//            let accidentalView = AccidentalView.makeAccidental(accidental,
//                at: CGPoint(x: x, y: 100),
//                staffSlotHeight: 12
//            )
//            view.layer.addSublayer(accidentalView)
//            x += 20
//        }
//        
//        let layer = CALayer()
//        layer.frame = view.frame.insetBy(dx: 100, dy: 100)
//        
//        let pitch: Pitch = 60
//        let collection: PitchCollection = [60, 61, 62, 63]
//        let set: PitchSet = [57, 66, 81]
//        let setSequence: [PitchSet] = [[60], [61,65], [66,81], [55,75]]
//
//        set.show(in: layer)
//
////        let collection: PitchCollection = PitchCollection((0..<1000).map { _ in Pitch.random() })
////        collection.show(in: layer)
////        layer.position.x += 200
////        layer.position.y += 200
//        view.layer.addSublayer(layer)
//        
//        layer.showTestBorder()
//        layer.renderToPDF(name: "staff_notes")
    }
}
