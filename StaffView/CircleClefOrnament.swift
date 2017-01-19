//
//  CircleClefOrnament.swift
//  StaffClef
//
//  Created by James Bean on 6/13/16.
//
//

import QuartzCore
import PathTools
import GraphicsTools

public final class CircleClefOrnament: CAShapeLayer, CircleClefComponent {
    
    public let point: CGPoint
    public let radius: CGFloat
    
    public init(
        point: CGPoint,
        radius: CGFloat,
        lineWidth: CGFloat,
        lineColor: CGColor = Color.red.cgColor,
        backgroundColor: CGColor = Color(gray: 1, alpha: 1).cgColor
    )
    {
        self.point = point
        self.radius = radius
        super.init()
        self.lineWidth = lineWidth
        self.strokeColor = lineColor
        self.fillColor = backgroundColor
        build()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
