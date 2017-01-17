//
//  StaffStructureRenderer.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import Collections
import QuartzCore
import StaffModel
import PathTools
import GraphicsTools
import PlotView

public struct StaffStructureRenderer: Renderer {

    private enum LedgerLineDirection: CGFloat {
        case above = -1
        case below = 1
    }
    
    private var staffLines = LinesSegmentCollection()
    private var ledgerLines: [Double: [LedgerLineDirection: Int]] = [:]
    
    private let model: StaffModel
    
    public init(model: StaffModel) {
        self.model = model
        self.staffLines = LinesSegmentCollection()
    }
    
    public mutating func startLines(at x: Double) {
        staffLines.startLines(at: x)
    }
    
    public mutating func stopLines(at x: Double) {
        staffLines.stopLines(at: x)
    }
    
    public mutating func addLedgerLines(at position: Double, above: Int, below: Int) {
        ledgerLines.ensureValue(for: position)
        ledgerLines[position]![.below] = below
        ledgerLines[position]![.above] = above
    }

    public func render(in context: CALayer, with configuration: StaffStructureConfiguration) {
        
        // Prepare both `CAShapeLayer` objects
        let staffLines = lines(configuration: configuration)
        let clefView = clef(configuration: configuration)
        
        // Add both `CAShapeLayer` objects to context
        context.addSublayer(staffLines)
        context.addSublayer(clefView)
    }
    
    private func clef(configuration: StaffStructureConfiguration) -> CALayer {
        let staffSlotHeight = configuration.staffSlotHeight
        return makeClef(
            kind: model.verticalAxis.kind,
            x: 0,
            staffTop: 0,
            staffSlotHeight: staffSlotHeight
        )
    }
    
    /// - returns: `StaffClefView` with the given `kind` and graphical configuration.
    private func makeClef(
        kind: Clef.Kind,
        x: CGFloat,
        staffTop: CGFloat,
        staffSlotHeight: StaffSlotHeight
    ) -> CALayer
    {
        return kind.view.init(
            x: x,
            staffTop: staffTop,
            staffSlotHeight: staffSlotHeight
        ) as! CALayer
    }
    
    private func lines(configuration: StaffStructureConfiguration) -> CALayer {
        let linesLayer = CALayer()
        linesLayer.addSublayer(staffLinesLayer(configuration: configuration))
        linesLayer.addSublayer(ledgerLinesLayer(configuration: configuration))
        return linesLayer
    }
    
    private func staffLinesLayer(configuration: StaffStructureConfiguration) -> CALayer {
        let staffLinesLayer = CAShapeLayer()
        staffLinesLayer.path = staffLines(configuration: configuration).cgPath
        staffLinesLayer.lineWidth = CGFloat(configuration.lineWidth)
        staffLinesLayer.strokeColor = configuration.linesColor.cgColor
        return staffLinesLayer
    }
    
    private func ledgerLinesLayer(configuration: StaffStructureConfiguration) -> CALayer {
        let ledgerLinesLayer = CAShapeLayer()
        ledgerLinesLayer.path = ledgerLines(configuration: configuration).cgPath
        ledgerLinesLayer.lineWidth = CGFloat(configuration.ledgerLineWidth)
        ledgerLinesLayer.strokeColor = configuration.linesColor.cgColor
        return ledgerLinesLayer
    }
    
    private func staffLines(configuration: StaffStructureConfiguration) -> Path {
        
        let staffSlotHeight = configuration.staffSlotHeight
        
        let path = Path()
        
        for segment in staffLines {
            
            (0..<5).forEach { lineNumber in
                let altitude = CGFloat(lineNumber) * CGFloat(staffSlotHeight) * 2
                let left = CGFloat(segment.start)
                let right = CGFloat(segment.stop)
                
                path.move(to: CGPoint(x: left, y: altitude))
                    .addLine(to: CGPoint(x: right, y: altitude))
            }
        }
        return path
    }
    
    private func ledgerLines(configuration: StaffStructureConfiguration) -> Path {
        
        let staffSlotHeight = configuration.staffSlotHeight
        
        let length = configuration.ledgerLineLength
        let path = Path()
        for (x, amountByDirection) in ledgerLines {
            for (direction, amount) in amountByDirection {
                
                let left = CGFloat(x - 0.5 * length)
                let right = CGFloat(x + 0.5 * length)
                
                let refY = direction == .above ? -2 * CGFloat(staffSlotHeight) : 10 * CGFloat(staffSlotHeight)
                
                (0..<amount).forEach { number in
                    let altitude = CGFloat(number) * direction.rawValue * 2 * CGFloat(staffSlotHeight) + refY
                    path.move(to: CGPoint(x: left, y: altitude))
                        .addLine(to: CGPoint(x: right, y: altitude))
                }
            }
        }
        
        return path
    }
}
