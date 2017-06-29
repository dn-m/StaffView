//
//  StaffLinesCollection.swift
//  StaffView
//
//  Created by James Bean on 6/29/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import PlotView

public struct StaffLinesCollection: Renderable {
    
    private func staffLines(configuration: StaffConfiguration) -> StyledPath {
        
        let staffSlotHeight = configuration.staffSlotHeight
        
        let path = Path(
            staffLines.flatMap { segment in
                return (0..<5).map { lineNumber in
                    let altitude = Double(lineNumber) * staffSlotHeight * 2
                    let left = segment.start
                    let right = segment.stop
                    return BezierCurve(
                        start: Point(x: left, y: altitude),
                        end: Point(x: right, y: altitude)
                    )
                }
            }
        )
        
        let styling = Styling(
            stroke: Stroke(width: configuration.lineWidth, color: configuration.linesColor)
        )
        
        return StyledPath(frame: .zero, path: path, styling: styling)
    }
    
    private func ledgerLines(configuration: StaffConfiguration) -> StyledPath {
        
        let staffSlotHeight = configuration.staffSlotHeight
        let length = configuration.ledgerLineLength
        var curves: [BezierCurve] = []
        
        for (x, amountByDirection) in ledgerLines {
            for (direction, amount) in amountByDirection {
                let left = x - 0.5 * length
                let right = x + 0.5 * length
                let refY = direction == .above ? -2 * staffSlotHeight : 10 * staffSlotHeight
                
                for number in 0..<amount {
                    let altitude = Double(number) * direction.rawValue * 2 * staffSlotHeight + refY
                    let curve = BezierCurve(
                        start: Point(x: left, y: altitude),
                        end: Point(x: right, y: altitude)
                    )
                    curves.append(curve)
                }
            }
        }
        
        let path = Path(curves)
        
        let styling = Styling(
            stroke: Stroke(
                width: configuration.ledgerLineWidth,
                color: configuration.linesColor
            )
        )
        
        return StyledPath(frame: .zero, path: path, styling: styling)
    }
    
    public var rendered: StyledPath.Composite {
        
        let group = StyledPath.Group("lines")
        
        let paths = [
            staffLines(configuration: configuration),
            ledgerLines(configuration: configuration)
        ]
        
        return .branch(group, paths.map { .leaf($0) })
    }
    
    let staffLines: LinesSegmentCollection
    let ledgerLines: [Double: [LedgerLineDirection: Int]]
    let configuration: StaffConfiguration
    
    public init(
        staffLines: LinesSegmentCollection,
        ledgerLines: [Double: [LedgerLineDirection: Int]],
        configuration: StaffConfiguration
    )
    {
        self.staffLines = staffLines
        self.ledgerLines = ledgerLines
        self.configuration = configuration
    }
}
