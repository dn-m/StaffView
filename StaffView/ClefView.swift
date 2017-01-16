//
//  ClefView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import QuartzCore
import GraphicsTools

public protocol ClefView: CompositeShapeType {
    
    var x: CGFloat { get }
    var staffTop: CGFloat { get }
    var lineWidth: CGFloat { get }
    var staffSlotHeight: StaffSlot { get }
    var extenderLength: CGFloat { get }
    
    init(x: CGFloat, staffTop: CGFloat, staffSlotHeight: StaffSlot)
}

extension ClefView {
    
    public var extenderLength: CGFloat {
        return 1 * CGFloat(staffSlotHeight)
    }
    
    public var lineWidth: CGFloat {
        return 0.15 * CGFloat(staffSlotHeight)
    }
    
    public var line: LineClefComponent {
        return LineClefComponent(
            height: frame.height,
            lineWidth: lineWidth,
            color: Color.red.cgColor
        )
    }
    
    public func makeFrame() -> CGRect {
        return CGRect(
            x: x,
            y: staffTop - extenderLength,
            width: 0,
            height: 8 * CGFloat(staffSlotHeight) + 2 * extenderLength
        )
    }
}
