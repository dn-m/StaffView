//
//  StaffView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import PlotModel
import StaffModel
import PlotView

public struct StaffView: VerticalPlotView {
    
    // TODO: Articulations, etc
    public struct PointView: CompositeRenderable {
        
        public var components: [Renderable] {
            let noteheads: [Renderable] = pitches.flatMap { $0.notehead }
            let accidentals: [Renderable] = pitches.flatMap { $0.accidental }
            return noteheads + accidentals
        }
        
        public let position: Double
        public let pitches: [StaffRepresentedPitch]
        
        public init(pitches: [StaffRepresentedPitch], at position: Double) {
            self.pitches = pitches
            self.position = position
        }
    }
    
    public let clef: StaffClefView
    public let lines: StaffLinesCollection
    
    // TODO: Use `SortedDictionary<Double, [PointView]>`
    public let points: [Double: [PointView]]
    
    public typealias Model = StaffModel
    
    public init(clef: StaffClefView, lines: StaffLinesCollection, points: [Double: [PointView]]) {
        self.clef = clef
        self.lines = lines
        self.points = points
    }
    
    public init(model: Model, configuration: StaffConfiguration = StaffConfiguration()) {
        self = Builder(model: model, configuration: configuration).build()
    }

    // Ultimately, this is probably useless, if we use builders for everything...
    public func concreteVerticalPosition(for slot: Model.VerticalAxis.Coordinate) -> Double {
        fatalError()
        //return StaffSlotHeight(4 - slot) * configuration.staffSlotHeight
    }
}

extension StaffView {
    
    // MARK: - Rendering
    
    public var components: [Renderable] {
        let pointViews: [Renderable] = points.flatMap { _, views in views }
        return [lines, clef] + pointViews
    }
}
