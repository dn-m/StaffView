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

/// Graphical representation of a musical staff.
public struct StaffView: VerticalPlotView {
    
    /// Points.
    public let points: [PointView]
    
    /// Clef.
    public let clef: StaffClefView
    
    /// Staff and ledger lines.
    public let lines: StaffLinesCollection
    
    // FIXME: This is left over from an over-engineered `PlotModel`.
    public typealias Model = StaffModel
    
    /// Creates a `StaffView` with the given `clef`, `lines`, and `points`.
    public init(clef: StaffClefView, lines: StaffLinesCollection, points: [PointView]) {
        self.clef = clef
        self.lines = lines
        self.points = points
    }
    
    public init(model: Model, configuration: StaffConfiguration = StaffConfiguration()) {
        self = Builder(model: model, configuration: configuration).build()
    }

    // FIXME: Ultimately, this is useless, if builders are used for everything.
    // FIXME: This is left over from an over-engineered `PlotModel`.
    public func concreteVerticalPosition(for slot: Model.VerticalAxis.Coordinate) -> Double {
        fatalError()
    }
}

extension StaffView {
    
    // MARK: - Rendering

    public var components: [Renderable] {
        let points: [Renderable] = self.points
        let result: [Renderable] = [lines, clef] + points
        return result
    }
}
