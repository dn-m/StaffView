//
//  AltoClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//


import GeometryTools
import PathTools
import GraphicsTools
import PlotView
import StaffModel

public final class AltoClef: StaffClefView {
    
    public override var ornamentAltitude: Double {
        return 4 * staffSlotHeight + extenderLength
    }
    
    public override var ornament: Path {
        let width = 0.8 * staffSlotHeight
        return Path.square(
            center: Point(x: 0.5 * width, y: 0.5 * width),
            width: width
        ).rotated(by: Angle(degrees: 45), around: Point(x: 0.5 * width, y: 0.5 * width))
    }
}
