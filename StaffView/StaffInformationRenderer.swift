//
//  StaffInformationRenderer.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import QuartzCore
import Pitch
import PitchSpellingTools
import StaffModel
import GraphicsTools

public class StaffInformationRenderer: Renderer {
    
    private var staffLinesRenderDelegate: StaffLinesRenderDelegate?
    let model: StaffModel
    
    /// - TODO: Do not pass model
    public init(
        model: StaffModel,
        staffLinesRenderDelegate: StaffLinesRenderDelegate? = nil
    )
    {
        self.model = model
        self.staffLinesRenderDelegate = staffLinesRenderDelegate
    }
    
    public func render(
        in context: CALayer,
        with configuration: StaffInformationConfiguration
    )
    {
        startLines(at: 0)
        
        for (position, points) in model {
            
            startLines(at: position)

            for point in points {
                let (above, below) = point.ledgerLines(model.verticalAxis)
                
                delegateLedgerLineRendering(at: position, above: above, below: below)
                
                let slots = point.elements
                    .map { $0.spelledPitch }
                    .map(model.verticalAxis.coordinate)
                
                print("slots: \(slots)")
                
                let lowestSlot = model.verticalAxis.coordinate(point.elements.first!.spelledPitch)
                
                let altitude = StaffSlotHeight(4 - lowestSlot) * configuration.staffSlotHeight
                
                let represented = StaffRepresentedPitch(representableContext: point.elements.first!, altitude: CGFloat(altitude), staffSlotHeight: configuration.staffSlotHeight)
                
                represented.notehead?.position.x = CGFloat(position)
                represented.accidental?.position.x = CGFloat(position) - 30
                
                context.addSublayer(represented.notehead!)
                context.addSublayer(represented.accidental!)
                
            }
        }
    }
    
    private func startLines(at position: Double) {
        staffLinesRenderDelegate?.startLines(at: position)
    }
    
    private func stopLines(at position: Double) {
        staffLinesRenderDelegate?.stopLines(at: position)
    }
    
    private func delegateLedgerLineRendering(at position: Double, above: Int, below: Int) {
        staffLinesRenderDelegate?.addLedgerLines(at: position, above: above, below: below)
    }
}
