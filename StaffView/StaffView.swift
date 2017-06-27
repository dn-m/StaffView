//
//  StaffView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import QuartzCore
import PlotModel
import StaffModel
import GraphicsTools
import PlotView

public struct StaffRenderConfiguration {
    public let informationConfiguration: StaffInformationConfiguration
    public let structureConfiguration: StaffStructureConfiguration
}

public struct StaffRenderer {
    
    public let informationRenderer: StaffInformationRenderer
    public let structureRenderer: StaffStructureRenderer
    
    public init(model: StaffModel) {
        self.structureRenderer = StaffStructureRenderer(model: model)
        self.informationRenderer = StaffInformationRenderer(
            model: model,
            staffLinesRenderDelegate: structureRenderer
        )
    }

    public func render(in context: CALayer, with configuration: StaffRenderConfiguration) {
        let structure = CALayer()
        let information = CALayer()
        informationRenderer.render(in: information, with: configuration.informationConfiguration)
        structureRenderer.render(in: structure, with: configuration.structureConfiguration)
        context.addSublayer(structure)
        context.addSublayer(information)
    }
}

public struct StaffView: VerticalPlotView {
    
    public var rendered: StyledPath.Composite {
        
        let renderer = StaffRenderer(model: model)

        let staffSlotHeight = configuration.staffSlotHeight

        let structureConfig = StaffStructureConfiguration(
            staffSlotHeight: staffSlotHeight,
            linesColor: Color(gray: 0.5, alpha: 1),
            clefColor: Color.red,
            maskColor: Color(gray: 1, alpha: 1)
        )

        let infoConfig = StaffInformationConfiguration(
            staffSlotHeight: staffSlotHeight,
            noteheadColor: Color.red
        )

        _ = StaffRenderConfiguration(
            informationConfiguration: infoConfig,
            structureConfiguration: structureConfig
        )

        // temporary
        renderer.structureRenderer.stopLines(at: Double(model.count) * 100 + 100)

        fatalError()
    }
    
    public typealias Configuration = StaffViewConfiguration
    public typealias Model = StaffModel

    let model: Model
    let configuration: Configuration
    
    public init(model: Model, configuration: Configuration = StaffViewConfiguration()) {
        self.model = model
        self.configuration = configuration
    }

    public var concreteVerticalPosition: (Model.VerticalAxis.Coordinate) -> Double = {
        coordinate in 0
    }
}
//
//    public typealias Model = StaffModel
//    public typealias VerticalCoordinate = StaffSlot
//    public typealias Configuration = StaffViewConfiguration
//
//    
//    // FIXME: Declaring this specifically should not be necessary. All that should be needed
//    // is `public let renderer: StaffRenderer`.
//    //
//    // Audit the `PlotView` -> `StaffView` protocol inheritence
//    //public typealias Renderer = StaffRenderer
//    
//    //public let renderer: StaffRenderer
//    
//    /// FIXME: Not yet implemented!
//    public let concreteVerticalPosition: (StaffSlot) -> Double = { _ in fatalError() }
//    
//    /// FIXME: Not yet implemented!
//    public let concreteHorizontalPosition: (Double) -> Double = { _ in fatalError() }
//
//    public let model: StaffModel
//    
//    public init(model: StaffModel) {
//        self.model = model
//        
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    public func render(with configuration: StaffViewConfiguration) -> ConfiguredPlotView {
//        
//        let renderer = StaffRenderer(model: model)
//
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
//        
//        //renderer.render(in: context, with: config)
//    }
//}

extension CALayer {
    
    var boundingBoxOfSublayers: CGRect {
        
        func traverse(_ layer: CALayer) {
            print("\(type(of: layer)): \(layer.frame)")
            
            if let shapeLayer = layer as? CAShapeLayer {
                print("-- shape layer: \(shapeLayer.path?.boundingBoxOfPath)")
            }
            
            if let sublayers = layer.sublayers, !sublayers.isEmpty {
                sublayers.forEach(traverse)
            }
        }
        
        traverse(self)
        
        return CGRect.zero
    }
}
