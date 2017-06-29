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
        
        public let pitches: [StaffRepresentedPitch]
        public init(pitches: [StaffRepresentedPitch]) {
            self.pitches = pitches
        }
    }
    
    public let clef: StaffClefView
    public let lines: StyledPath.Composite
    
    // Use SortedDictionary
    public let points: [Double: [PointView]]
    
    public typealias Model = StaffModel
    
    // TODO: Make LinesView legite type
    public init(clef: StaffClefView, lines: StyledPath.Composite, points: [Double: [PointView]]) {
        self.clef = clef
        self.points = points
        self.lines = lines
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
    
    public var rendered: StyledPath.Composite {
        let group = StyledPath.Group("staff")
        let pointPaths: [StyledPath.Composite] =
            points.flatMap { position, pointViews in
                let frame = Rectangle(x: position, y: 0, width: 0, height: 0)
                let group = StyledPath.Group("point", frame: frame)
                return .branch(group, pointViews.map { $0.rendered })
        }
        return .branch(group, [lines, clef.rendered] + pointPaths)
    }
}
