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

public class StaffStructureRenderer: Renderer, StaffLinesRenderDelegate {

    private enum LedgerLineDirection: Double {
        case above = -1
        case below = 1
    }
    
    private var staffLines = LinesSegmentCollection()
    private var ledgerLines: [Double: [LedgerLineDirection: Int]] = [:]
    private let model: StaffModel
    
    /// - TODO: Do not pass model, just clef
    public init(model: StaffModel) {
        self.model = model
        self.staffLines = LinesSegmentCollection()
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
            staffSlotHeight: staffSlotHeight,
            foregroundColor: configuration.clefColor,
            maskColor: configuration.maskColor
        )
    }
    
    /// - returns: `StaffClefView` with the given `kind` and graphical configuration.
    private func makeClef(
        kind: Clef.Kind,
        x: Double,
        staffTop: Double,
        staffSlotHeight: StaffSlotHeight,
        foregroundColor: Color,
        maskColor: Color
    ) -> CALayer
    {
        return kind.view.init(
            x: x,
            staffTop: staffTop,
            staffSlotHeight: staffSlotHeight,
            foregroundColor: foregroundColor,
            maskColor: maskColor
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
                let altitude = Double(lineNumber) * staffSlotHeight * 2
                let left = segment.start
                let right = segment.stop
                
                path.move(to: Point(x: left, y: altitude))
                    .addLine(to: Point(x: right, y: altitude))
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
                
                let left = x - 0.5 * length
                let right = x + 0.5 * length
                
                let refY = direction == .above ? -2 * staffSlotHeight : 10 * staffSlotHeight
                
                (0..<amount).forEach { number in
                    let altitude = Double(number) * direction.rawValue * 2 * staffSlotHeight + refY
                    path.move(to: Point(x: left, y: altitude))
                        .addLine(to: Point(x: right, y: altitude))
                }
            }
        }
        
        return path
    }
}
