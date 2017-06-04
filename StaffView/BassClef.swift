//
//  BassClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import StaffModel
import QuartzCore
import PathTools
import GraphicsTools

public final class BassClef: CALayer, ClefView {
    
    public var ornamentAltitude: Double {
        return 1 * staffSlotHeight + extenderLength
    }
    
    private var dots: [DotClefOrnament] {
        
        // Create a dot above and below (by 0.8 staff slots) the `ornamentAltitude`
        return [-1, 1].map { sign in
            DotClefOrnament(
                point: Point(
                    x: 0.5 * staffSlotHeight,
                    y: ornamentAltitude + 0.8 * Double(sign)
                ),
                radius: 0.175 * staffSlotHeight,
                color: Color.red.cgColor
            )
        }
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
        components = [line] + dots
    }
}
