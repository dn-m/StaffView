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
        return 6 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: Path {
        let dots = [-1,1].map { sign in
            Path.circle(
                center: Point(x: 0.5 * staffSlotHeight, y: ornamentAltitude * Double(sign)),
                radius: 0.175 * staffSlotHeight
            )
        }
        return dots.sum
    }
}
