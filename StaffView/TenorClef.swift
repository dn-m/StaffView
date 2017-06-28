//
//  TenorClef.swift
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

public final class TenorClef: StaffClefView {

    public override var ornamentAltitude: Double {
        return 2 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: Path {
        let width = 0.8 * staffSlotHeight
        return Path.square(
            center: Point(x: 0.5 * width, y: 0.5 * width),
            width: width
        ).rotated(by: Angle(degrees: 45), around: Point(x: 0.5 * width, y: 0.5 * width))
    }
}
