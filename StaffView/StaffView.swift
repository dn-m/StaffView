//
//  StaffView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import QuartzCore
import StaffModel
import GraphicsTools
import PlotModel
import PlotView

public struct StaffRenderConfiguration {
    public let informationConfiguration: StaffInformationConfiguration
    public let structureConfiguration: StaffStructureConfiguration
}

public struct StaffRenderer: PlotRenderer {
    
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

public final class StaffView: CALayer, PlotView, Renderer {
    
    // FIXME: Declaring this specifically should not be necessary. All that should be needed
    // is `public let renderer: StaffRenderer`.
    //
    // Audit the `PlotView` -> `StaffView` protocol inheritence
    public typealias Renderer = StaffRenderer
    
    public let renderer: StaffRenderer
    
    /// FIXME: Not yet implemented!
    public let concreteVerticalPosition: (StaffSlot) -> Double = { _ in fatalError() }
    
    /// FIXME: Not yet implemented!
    public let concreteHorizontalPosition: (Double) -> Double = { _ in fatalError() }

    public let model: StaffModel
    
    public init(model: StaffModel) {
        self.model = model
        self.renderer = StaffRenderer(model: model)
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func render(in context: CALayer, with configuration: StaffViewConfiguration) {

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
        
        let config = StaffRenderConfiguration(
            informationConfiguration: infoConfig,
            structureConfiguration: structureConfig
        )

        // temporary
        renderer.structureRenderer.stopLines(at: Double(model.count) * 100 + 100)
        
        renderer.render(in: context, with: config)
    }
}

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
