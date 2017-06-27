//
//  PitchSetSequence+Showable.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import Pitch
import StaffModel
import QuartzCore

//extension Sequence where Iterator.Element == PitchSet {
//    
//    public func show(in context: CALayer) {
//        
//        // Extend PitchSet to be defaultSpellable
//        let spelled = map { $0.spelledWithDefaultSpelling() }
//        let representable = spelled.map { $0.map { StaffRepresentablePitch($0) } }
//        let points = representable.map { StaffPointModel($0) }
//        
//        var positions: [Double] = []
//        var accum: Double = 100
//        for _ in points.indices {
//            positions.append(accum)
//            accum += 100
//        }
//        
//        let builder = StaffModel.builder
//        
//        //var model = StaffModel()
//        
//        zip(positions, points).forEach { position, point in
//            builder.add(point, at: position)
//        }
//        
//        let model = builder.build()
//        
//        let staffView = StaffView(model: model)
//        let styledPath = staffView.rendered
//        let layer = CALayer(styledPath)
//        context.addSublayer(layer)
//        //staffView.render(in: context, with: StaffViewConfiguration())
//    }
//}
