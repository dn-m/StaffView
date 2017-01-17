//
//  NoteheadView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import QuartzCore
import PathTools
import GraphicsTools

/// - TODO: Decouple `NoteheadView` from `staffSlotHeight`.
public class NoteheadView: CAShapeLayer, ShapeType {
    
    public var point: CGPoint
    public var staffSlotHeight: StaffSlot
    
    public var color: Color = Color(gray: 0.5, alpha: 1) {
        didSet {
            fillColor = color.cgColor
        }
    }
    
    private var width: CGFloat {
        return 1.236 * CGFloat(staffSlotHeight)
    }
    
    private var height: CGFloat {
        return 0.75 * width
    }
    
    public init(point: CGPoint, staffSlotHeight: StaffSlot) {
        self.point = point
        self.staffSlotHeight = staffSlotHeight
        super.init()
        self.fillColor = Color(gray: 0.75, alpha: 1).cgColor
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public func makePath() -> CGPath {
        
        return Path.ellipse(rectangle: CGRect(x: 0, y: 0, width: width, height: height))
            .rotated(by: -45)
            .cgPath
    }
    
    public func makeFrame() -> CGRect {
        return CGRect(
            x: point.x - 0.5 * width,
            y: point.y - 0.5 * height,
            width: width,
            height: height
        )
    }
}
