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
    
    var x: Double { get }
    var staffTop: Double { get }
    var lineWidth: Double { get }
    var staffSlotHeight: StaffSlotHeight { get }
    var foregroundColor: Color { get }
    var maskColor: Color { get }
    
    var extenderLength: Double { get }
    
    init(
        x: Double,
        staffTop: Double,
        staffSlotHeight: StaffSlotHeight,
        foregroundColor: Color,
        maskColor: Color
    )
}

extension ClefView {
    
    public var extenderLength: Double {
        return 1 * Double(staffSlotHeight)
    }
    
    public var lineWidth: Double {
        return 0.2 * Double(staffSlotHeight)
    }
    
    public var line: LineClefComponent {
        print("frame.height: \(frame.height)")
        return LineClefComponent(
            height: Double(frame.height),
            lineWidth: lineWidth,
            color: foregroundColor.cgColor
        )
    }
    
    public func makeFrame() -> CGRect {
        return CGRect(
            x: x,
            y: staffTop - extenderLength,
            width: 0,
            height: 8 * Double(staffSlotHeight) + 2 * extenderLength
        )
    }
}

extension Clef.Kind {
    
    public var view: ClefView.Type {
        switch self {
        case .bass:
            return TrebleClef.self
        case .tenor:
            return TenorClef.self
        case .alto:
            return AltoClef.self
        case .treble:
            return TrebleClef.self
        }
    }
}
