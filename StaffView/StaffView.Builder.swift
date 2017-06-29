//
//  StaffView.Builder.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import PlotModel
import StaffModel
import PlotView

public enum LedgerLineDirection: Double {
    case above = -1
    case below = 1
}

extension StaffView {
    
    public class Builder {
        
        
        
        // Intput
        private let clef: Clef
        private let configuration: StaffConfiguration
        
        // Intermediate representation
        private var staffLines = LinesSegmentCollection()
        private var ledgerLines: [Double: [LedgerLineDirection: Int]] = [:]
        private var points: [Double: [PointView]] = [:]
        
        public init(clef: Clef, configuration: StaffConfiguration) {
            self.clef = clef
            self.configuration = configuration
        }
        
        public init(model: StaffModel, configuration: StaffConfiguration) {
            
            self.clef = model.verticalAxis
            self.configuration = configuration
            
            startLines(at: 0)
            for (position, points) in model {
                startLines(at: position)
                for point in points {
                    let (above, below) = point.ledgerLines(model.verticalAxis)
                    addLedgerLines(at: position, above: above, below: below)
                    let pointView = PointView(
                        of: point,
                        at: position,
                        clef: model.verticalAxis,
                        staffSlotHeight: configuration.staffSlotHeight
                    )
                    add(pointView, at: position)
                }
            }
            
            // FIXME: Probably done from the outside
            stopLines(at: model.points.keys.max()! + 100)
        }
        
        public func add(_ point: PointView, at position: Double) {
            points.safelyAppend(point, toArrayWith: position)
        }
        
        public func startLines(at x: Double) {
            staffLines.startLines(at: x)
        }
        
        public func stopLines(at x: Double) {
            staffLines.stopLines(at: x)
        }
        
        public func addLedgerLines(at position: Double, above: Int, below: Int) {
            ledgerLines.ensureValue(for: position)
            ledgerLines[position]![.below] = below
            ledgerLines[position]![.above] = above
        }
        
        private func makeClef(with configuration: StaffConfiguration) -> StaffClefView {
            
            let position = StaffClefView.Position(
                x: 0,
                plotTop: 0,
                plotBottom: 8 * configuration.staffSlotHeight
            )
            
            let clefConfig = StaffClefView.Configuration(
                foregroundColor: configuration.clefColor,
                maskColor: .white
            )
            
            return StaffClefView.makeClef(clef.kind, at: position, with: clefConfig)
        }
        
//        private func staffLines(configuration: StaffConfiguration) -> StyledPath {
//            
//            let staffSlotHeight = configuration.staffSlotHeight
//            
//            let path = Path(
//                staffLines.flatMap { segment in
//                    return (0..<5).map { lineNumber in
//                        let altitude = Double(lineNumber) * staffSlotHeight * 2
//                        let left = segment.start
//                        let right = segment.stop
//                        return BezierCurve(
//                            start: Point(x: left, y: altitude),
//                            end: Point(x: right, y: altitude)
//                        )
//                    }
//                }
//            )
//            
//            let styling = Styling(
//                stroke: Stroke(width: configuration.lineWidth, color: configuration.linesColor)
//            )
//            
//            return StyledPath(frame: .zero, path: path, styling: styling)
//        }
//        
//        private func ledgerLines(configuration: StaffConfiguration) -> StyledPath {
//            
//            let staffSlotHeight = configuration.staffSlotHeight
//            let length = configuration.ledgerLineLength
//            var curves: [BezierCurve] = []
//            
//            for (x, amountByDirection) in ledgerLines {
//                for (direction, amount) in amountByDirection {
//                    let left = x - 0.5 * length
//                    let right = x + 0.5 * length
//                    let refY = direction == .above ? -2 * staffSlotHeight : 10 * staffSlotHeight
//                    
//                    for number in 0..<amount {
//                        let altitude = Double(number) * direction.rawValue * 2 * staffSlotHeight + refY
//                        let curve = BezierCurve(
//                            start: Point(x: left, y: altitude),
//                            end: Point(x: right, y: altitude)
//                        )
//                        curves.append(curve)
//                    }
//                }
//            }
//            
//            let path = Path(curves)
//            
//            let styling = Styling(
//                stroke: Stroke(
//                    width: configuration.ledgerLineWidth,
//                    color: configuration.linesColor
//                )
//            )
//            
//            return StyledPath(frame: .zero, path: path, styling: styling)
//        }
//        
//        private func makeLines(configuration: StaffConfiguration) -> StyledPath.Composite {
//            
//            let group = StyledPath.Group("lines")
//            
//            let paths = [
//                staffLines(configuration: configuration),
//                ledgerLines(configuration: configuration)
//            ]
//            
//            return .branch(group, paths.map { .leaf($0) })
//        }
        
        public func build() -> StaffView {
            let clef = makeClef(with: configuration)
            let lines = StaffLinesCollection(
                staffLines: staffLines,
                ledgerLines: ledgerLines,
                configuration: configuration
            )
            return StaffView(clef: clef, lines: lines, points: points)
        }
    }
}

extension StaffView.PointView {
    
    init(of pointModel: StaffPointModel, at position: Double, clef: Clef, staffSlotHeight: StaffSlotHeight) {
        
        let pitches: [StaffRepresentedPitch] = pointModel.elements.map { element in
            
            let slot = clef.coordinate(element.spelledPitch)
            let altitude = StaffSlotHeight(4 - slot) * staffSlotHeight
            
            return StaffRepresentedPitch(
                for: element,
                at: position,
                altitude: altitude,
                staffSlotHeight: staffSlotHeight
            )
        }
        
        self.init(pitches: pitches, at: position)
    }
}

extension Path {
    
    public init(lines: [Line.Segment]) {
        self.init(lines.map { BezierCurve.init($0) })
    }
}
