//
//  StaffView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import QuartzCore
import StaffModel
import PlotView

public final class StaffView: CALayer, PlotView {
    
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
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func build() {
        
        // structure.render
        // information.render
    }
}
