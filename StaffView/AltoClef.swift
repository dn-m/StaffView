//
//  AltoClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import StaffModel
import QuartzCore
import PathTools
import GraphicsTools

public final class AltoClef: CALayer, ClefView {
    
    public var ornamentAltitude: Double {
        return 4 * staffSlotHeight + extenderLength
    }
    
    /// - FIXME: Test width !
    private var diamond: DiamondClefOrnament {
        return DiamondClefOrnament(
            point: Point(x: 0, y: ornamentAltitude),
            width: 0.8 * staffSlotHeight,
            lineWidth: lineWidth,
            color: Color.red.cgColor
        )
    }
    
    /// Components that need to built and added
    public var components: [CALayer] = []
    public let x: Double
    public let staffTop: Double
    public let staffSlotHeight: StaffSlotHeight
    public let foregroundColor: Color
    public let maskColor: Color
    
    public init(
        x: Double,
        staffTop: Double,
        staffSlotHeight: StaffSlotHeight,
        foregroundColor: Color,
        maskColor: Color
    )
    {
        self.x = x
        self.staffTop = staffTop
        self.staffSlotHeight = staffSlotHeight
        self.foregroundColor = foregroundColor
        self.maskColor = maskColor
        super.init()
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func createComponents() {
        components = [line, diamond]
    }
}
