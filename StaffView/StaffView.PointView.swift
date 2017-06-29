//
//  StaffView.PointView.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import GraphicsTools

extension StaffView {
    
    /// Manages a single verticality of pitches represented on a `StaffView`.
    ///
    /// - TODO: Staff-based articulations
    /// - TODO: Accidental collision
    /// - TODO: Notehaead moving
    ///
    public struct PointView {

        public let position: Double
        public let pitches: [StaffRepresentedPitch]
        
        public init(pitches: [StaffRepresentedPitch], at position: Double) {
            self.pitches = pitches
            self.position = position
        }
    }
}

extension StaffView.PointView: CompositeRenderable {
    
    // MARK: - CompositeRenderable
    
    /// Subcomponents to be rendered.
    public var components: [Renderable] {
        let noteheads: [Renderable] = pitches.flatMap { $0.notehead }
        let accidentals: [Renderable] = pitches.flatMap { $0.accidental }
        return noteheads + accidentals
    }
}
