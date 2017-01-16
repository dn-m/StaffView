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
    
    public var ornamentAltitude: CGFloat {
        return 4 * CGFloat(staffSlotHeight) + extenderLength
    }
    
    /// - FIXME: Test width !
    private var diamond: DiamondClefOrnament {
        return DiamondClefOrnament(
            point: CGPoint(x: 0, y: ornamentAltitude),
            width: 0.8 * CGFloat(staffSlotHeight),
            lineWidth: lineWidth,
            color: Color.red.cgColor
        )
    }
    
    /// Components that need to built and added
    public var components: [CALayer] = []
    public let x: CGFloat
    public let staffTop: CGFloat
    public let staffSlotHeight: StaffSlot
    
    public init(x: CGFloat, staffTop: CGFloat, staffSlotHeight: StaffSlot) {
        self.x = x
        self.staffTop = staffTop
        self.staffSlotHeight = staffSlotHeight
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
