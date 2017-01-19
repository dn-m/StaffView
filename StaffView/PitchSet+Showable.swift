//
//  PitchSet+Showable.swift
//  StaffView
//
//  Created by James Bean on 1/19/17.
//
//

import Pitch
import StaffModel
import QuartzCore

extension PitchSet: Showable {
    
    public func show(in context: CALayer) {
        
        let spelled = map { $0.spelledWithDefaultSpelling() }
        let representable = spelled.map { StaffRepresentablePitch($0) }
        let point = StaffPointModel(representable)
        let position: Double = 100
        
        var model = StaffModel()
        model.addPoint(point, at: position)
        
        let staffView = StaffView(model: model)
        staffView.render(in: context, with: StaffViewConfiguration())
    }
}
