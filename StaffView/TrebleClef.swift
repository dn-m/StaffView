//
//  TrebleClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import StaffModel
import GeometryTools
import PathTools
import GraphicsTools
import PlotView

public final class TrebleClef: StaffClefView {
    
    public override var ornamentAltitude: Double {
        return 6 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: Path {
        return Path.circle(center: Point(x: 0, y: ornamentAltitude), radius: staffSlotHeight)
    }
}
