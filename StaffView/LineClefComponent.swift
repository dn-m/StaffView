//
//  LineClefComponent.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore
import GraphicsTools
import PathTools

public final class LineClefComponent: CAShapeLayer, ShapeType {
    
    public let height: Double

    public init(
        height: Double,
        lineWidth: Double,
        color: CGColor
    )
    {
        self.height = height
        super.init()
        self.strokeColor = color
        self.lineWidth = CGFloat(lineWidth)
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func makeFrame() -> CGRect {
        return CGRect(x: 0, y: 0, width: 0, height: height)
    }
    
    public func makePath() -> CGPath {
        return Path()
            .move(to: Point())
            .addLine(to: Point(x: 0, y: Double(frame.height)))
            .cgPath
    }
}
