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
        
        // FIXME
        startLines(at: 0)
        
        for (position, points) in model {
    
            // FIXME
            startLines(at: position)

            for point in points {
                
                let (above, below) = point.ledgerLines(model.verticalAxis)
                
                delegateLedgerLineRendering(at: position, above: above, below: below)

                for element in point.elements {
                    
                    let slot = model.verticalAxis.coordinate(element.spelledPitch)
                    let altitude = StaffSlotHeight(4 - slot) * configuration.staffSlotHeight
                    
                    let represented = StaffRepresentedPitch(
                        representableContext: element,
                        altitude: altitude,
                        staffSlotHeight: configuration.staffSlotHeight
                    )
                    
                    represented.notehead?.position.x = CGFloat(position)
                    
                    // FIXME: Inject accidental placement algorithm
                    represented.accidental?.position.x = CGFloat(position) - 30
                    
                    print("accidental frame: \(represented.accidental?.frame)")
                    print("notehad frame: \(represented.notehead?.frame)")
                    represented.accidental?.showTestBorder()
                    represented.notehead?.showTestBorder()
                    
                    context.addSublayer(represented.notehead!)
                    context.addSublayer(represented.accidental!)
                }
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
