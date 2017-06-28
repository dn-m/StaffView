//
//  BassClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import ArithmeticTools
import GeometryTools
import GraphicsTools
import PathTools
import PlotView
import StaffModel

public final class BassClef: StaffClefView {
    
    public override var ornamentAltitude: Double {
        return 1 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: StyledPath {
        
        let path = [-1,1].map { sign in
            Path.circle(
                center: Point(
                    x: 0.5 * staffSlotHeight,
                    y: ornamentAltitude + 0.8 * Double(sign) * staffSlotHeight
                ),
                radius: 0.175 * staffSlotHeight
            )
        }.sum
        
        let styling = Styling(fill: Fill(color: configuration.foregroundColor))
        
        return StyledPath(frame: frame, path: path, styling: styling)
    }
}
