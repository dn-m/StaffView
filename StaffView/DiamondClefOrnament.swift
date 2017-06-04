//
//  DiamondClefOrnament.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore
import GraphicsTools
import PathTools

public final class DiamondClefOrnament: CAShapeLayer, ShapeType {
    
    public let point: Point
    public let width: Double
    
    public init(point: Point, width: Double, lineWidth: Double, color: CGColor) {
        self.point = point
        self.width = width
        super.init()
        self.strokeColor = color
        self.fillColor = Color(gray: 0, alpha: 1).cgColor
        self.lineWidth = CGFloat(lineWidth)
        build()
    }
    
    public func makeFrame() -> CGRect {
        return CGRect(
            x: CGFloat(point.x - 0.5 * width),
            y: CGFloat(point.y - 0.5 * width),
            width: CGFloat(width),
            height: CGFloat(width)
        )
    }
    
    public func makePath() -> CGPath {
        return Path.square(
            center: Point(x: 0.5 * width, y: 0.5 * width),
            width: width
        ).rotated(by: 45).cgPath
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
