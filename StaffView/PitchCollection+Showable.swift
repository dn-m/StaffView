//
//  PitchCollection+Showable.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import Pitch
import StaffModel
import QuartzCore

//extension PitchCollection: Showable {
//    
//    public func show(in context: CALayer) {
//        
//        let spelled = map { $0.spelledWithDefaultSpelling() }
//        let representable = spelled.map { StaffRepresentablePitch($0) }
//        let points = representable.map { StaffPointModel([$0]) }
//        
//        var positions: [Double] = []
//        var accum: Double = 100
//        for _ in points.indices {
//            positions.append(accum)
//            accum += 100
//        }
//
//        var model = StaffModel()
//
//        zip(positions, points).forEach { position, point in
//            model.addPoint(point, at: position)
//        }
//        
//        let staffView = StaffView(model: model)
//        staffView.render(in: context, with: StaffConfiguration())
//    }
//}
