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

public struct StaffRenderConfiguration {
    public let informationConfiguration: StaffInformationConfiguration
    public let structureConfiguration: StaffStructureConfiguration
}

public final class StaffRenderer: Renderable {
    
    public var rendered: StyledPath.Composite {
        fatalError()
    }

    private enum LedgerLineDirection: Double {
        case above = -1
        case below = 1
    }
    
    private var staffLines = LinesSegmentCollection()
    private var ledgerLines: [Double: [LedgerLineDirection: Int]] = [:]
    private let model: StaffModel
    private let configuration: StaffConfiguration
    
    public init(model: StaffModel, configuration: StaffConfiguration) {
        self.model = model
        self.configuration = configuration
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
        fatalError()
    }
    
    private func staffLines(configuration: StaffStructureConfiguration) -> Path {
        
        let staffSlotHeight = configuration.staffSlotHeight
        
        return Path(
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
    }
    
    private func ledgerLines(configuration: StaffStructureConfiguration) -> Path {
        
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
        
        return Path(curves)
    }

//    public func render(in context: CALayer, with configuration: StaffRenderConfiguration) {
//        let structure = CALayer()
//        let information = CALayer()
//        informationRenderer.render(in: information, with: configuration.informationConfiguration)
//        structureRenderer.render(in: structure, with: configuration.structureConfiguration)
//        context.addSublayer(structure)
//        context.addSublayer(information)
//    }
}

public struct StaffView: VerticalPlotView {
    
    public typealias Model = StaffModel

    let model: Model
    let configuration: StaffConfiguration
    
    public init(model: Model, configuration: StaffConfiguration = StaffConfiguration()) {
        self.model = model
        self.configuration = configuration
    }

    public func concreteVerticalPosition(for slot: Model.VerticalAxis.Coordinate) -> Double {
        return StaffSlotHeight(4 - slot) * configuration.staffSlotHeight
    }
}

extension StaffView {
    
    // MARK: - Rendering
    
    public var rendered: StyledPath.Composite {
        return StaffRenderer(model: model, configuration: configuration).rendered
        
        
//        let staffSlotHeight = configuration.staffSlotHeight
//        
//        let structureConfig = StaffStructureConfiguration(
//            staffSlotHeight: staffSlotHeight,
//            linesColor: Color(gray: 0.5, alpha: 1),
//            clefColor: Color.red,
//            maskColor: Color(gray: 1, alpha: 1)
//        )
//        
//        let infoConfig = StaffInformationConfiguration(
//            staffSlotHeight: staffSlotHeight,
//            noteheadColor: Color.red
//        )
//        
//        _ = StaffRenderConfiguration(
//            informationConfiguration: infoConfig,
//            structureConfiguration: structureConfig
//        )
//        
//        // temporary
//        renderer.structureRenderer.stopLines(at: Double(model.count) * 100 + 100)
    }
    
    // MARK: - Lines
    

    
    // MARK: - Information
}


//extension CALayer {
//    
//    var boundingBoxOfSublayers: CGRect {
//        
//        func traverse(_ layer: CALayer) {
//            print("\(type(of: layer)): \(layer.frame)")
//            
//            if let shapeLayer = layer as? CAShapeLayer {
//                print("-- shape layer: \(shapeLayer.path?.boundingBoxOfPath)")
//            }
//            
//            if let sublayers = layer.sublayers, !sublayers.isEmpty {
//                sublayers.forEach(traverse)
//            }
//        }
//        
//        traverse(self)
//        
//        return CGRect.zero
//    }
//}
