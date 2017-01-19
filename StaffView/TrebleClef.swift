//
//  TrebleClef.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import StaffModel
import QuartzCore
import PathTools
import GraphicsTools

public final class TrebleClef: CALayer, ClefView {
    
    public var ornamentAltitude: CGFloat {
        return 6 * CGFloat(staffSlotHeight) + extenderLength
    }
    
    private var circle: CircleClefOrnament {
        return CircleClefOrnament(
            point: CGPoint(x: 0, y: ornamentAltitude),
            radius: 1 * CGFloat(staffSlotHeight),
            lineWidth: lineWidth,
            lineColor: Color.red.cgColor,
            backgroundColor: Color(gray: 1, alpha: 1).cgColor
        )
    }
    
    /// Components that need to built and added
    public var components: [CALayer] = []
    public let x: CGFloat
    public let staffTop: CGFloat
    public let staffSlotHeight: StaffSlotHeight
    public var foregroundColor: Color
    public var maskColor: Color
    
    public init(
        x: CGFloat,
        staffTop: CGFloat,
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
        components = [line, circle]
    }
}
