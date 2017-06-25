//
//  NoteheadView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import QuartzCore
import GeometryTools
import PathTools
import GraphicsTools

/// - TODO: Decouple `NoteheadView` from `staffSlotHeight`.
public class NoteheadView: CAShapeLayer, ShapeType {
    
    public var point: Point
    public var staffSlotHeight: StaffSlotHeight
    
    public var color: Color = Color(gray: 0.5, alpha: 1) {
        didSet {
            fillColor = color.cgColor
        }
    }
    
    private var width: Double {
        return 2.25 * staffSlotHeight
    }
    
    private var height: Double {
        return 0.75 * width
    }
    
    public init(point: Point, staffSlotHeight: StaffSlotHeight) {
        self.point = point
        self.staffSlotHeight = staffSlotHeight
        super.init()
        self.fillColor = Color(gray: 0.75, alpha: 1).cgColor
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public func build() {
        path = makePath()
        frame = makeFrame()
    }
    
    public func makePath() -> CGPath {
        let rect = Rectangle(x: 0, y: 0, width: width, height: height)
        let ellipse = Path.ellipse(in: rect)
        let rotated = ellipse.rotated(
            by: Angle(degrees: 45),
            around: Point(x: 0.5 * width, y: 0.5 * height)
        )
        return rotated.cgPath
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
