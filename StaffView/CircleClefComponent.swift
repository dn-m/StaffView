////
////  CircleClefComponent.swift
////  StaffClef
////
////  Created by James Bean on 6/13/16.
////
////
//
//import QuartzCore
//import GeometryTools
//import PathTools
//import GraphicsTools
//
//public protocol CircleClefComponent: ShapeType {
//    
//    var point: Point { get }
//    var radius: Double { get }
//}
//
//extension CircleClefComponent {
//    
//    public func makeFrame() -> CGRect {
//        return CGRect(
//            x: point.x - radius,
//            y: point.y - radius,
//            width: 2 * radius,
//            height: 2 * radius
//        )
//    }
//    
//    public func makePath() -> CGPath {
//        return Path.circle(center: Point(x: radius, y: radius), radius: radius).cgPath
//    }
//}
