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

public struct StaffInformationRenderer: Renderer {
    
    private let ledgerLinesRenderDelegate: LedgerLineRenderDelegate?
    let model: StaffModel
    
    public init(
        model: StaffModel,
        ledgerLinesRenderDelegate: LedgerLineRenderDelegate? = nil
    )
    {
        self.model = model
        self.ledgerLinesRenderDelegate = ledgerLinesRenderDelegate
    }
    
    public func render(
        in context: CALayer,
        with configuration: StaffInformationConfiguration
    )
    {
        for (position, points) in model {
            for point in points {
                let (above, below) = point.ledgerLines(model.verticalAxis)
                delegateLedgerLineRendering(at: position, above: above, below: below)
            }
        }
    }
    
    private func delegateLedgerLineRendering(at position: Double, above: Int, below: Int) {
        ledgerLinesRenderDelegate?.addLedgerLines(at: position, above: above, below: below)
    }
}
