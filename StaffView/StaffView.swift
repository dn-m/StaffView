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
import PlotView

public final class StaffView: CALayer, PlotView, Renderer {
    
    public let structure = CALayer()
    public let information = CALayer()
    
    public var informationRenderer: StaffInformationRenderer
    public var structureRenderer: StaffStructureRenderer
    
    public let concreteVerticalPosition: (StaffSlot) -> Double = { _ in fatalError() }
    public let concreteHorizontalPosition: (Double) -> Double = { _ in fatalError() }

    public let model: StaffModel
    
    public init(model: StaffModel) {
        self.model = model
        self.structureRenderer = StaffStructureRenderer(model: model)
        self.informationRenderer = StaffInformationRenderer(model: model)
        super.init()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func render(in context: CALayer, with configuration: StaffConfiguration) {
        
        let staffSlotHeight = configuration.staffSlotHeight
        
        let structureConfig = StaffStructureConfiguration(
            staffSlotHeight: staffSlotHeight,
            linesColor: Color(gray: 1, alpha: 1)
        )
        
        let infoConfig = StaffInformationConfiguration(
            staffSlotHeight: staffSlotHeight,
            noteheadColor: Color.red)
        
        structureRenderer.render(in: context, with: structureConfig)
        informationRenderer.render(in: context, with: infoConfig)
    }
}
