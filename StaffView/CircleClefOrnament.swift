////
////  CircleClefOrnament.swift
////  StaffClef
////
////  Created by James Bean on 6/13/16.
////
////
//
//import QuartzCore
//import GeometryTools
//import GraphicsTools
//
//public final class CircleClefOrnament: CAShapeLayer, CircleClefComponent {
//    
//    public let point: Point
//    public let radius: Double
//    
//    public init(
//        point: Point,
//        radius: Double,
//        lineWidth: Double,
//        lineColor: CGColor = Color.red.cgColor,
//        backgroundColor: CGColor = Color(gray: 1, alpha: 1).cgColor
//    )
//    {
//        self.point = point
//        self.radius = radius
//        super.init()
//        self.lineWidth = CGFloat(lineWidth)
//        self.strokeColor = lineColor
//        self.fillColor = backgroundColor
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
