////
////  AccidentalComponent.swift
////  DNM_iOS
////
////  Created by James Bean on 8/18/15.
////  Copyright © 2015 James Bean. All rights reserved.
////
//
//import QuartzCore
//import StaffModel
//import GeometryTools
//import PathTools
//import GraphicsTools
//
//public class AccidentalComponent: CAShapeLayer, ShapeType {
//    
//    public override var description: String { get { return "AccidentalComponent" } }
//    
//    public var staffSlotHeight: StaffSlotHeight = 0
//    public var scale: Double = 1
//    public var gS: Double { get { return Double(staffSlotHeight) * scale } }
//    
//    public enum Alignment {
//        case left, center, right
//    }
//    
//    public enum Direction {
//        case none, up, down
//    }
//    
//    public var alignment: Alignment = .center
//    
//    internal var thinLineWidth: Double { get { return 0.0875 * gS } }
//    
//    public var hasBeenBuilt: Bool = false
//    
//    public override init() {
//        super.init()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    private func setVisualAttributes() {
//        fillColor = Color.red.cgColor
//        lineWidth = 0
//    }
//    
//    public func makeFrame() -> CGRect {
//        fatalError()
//    }
//    
//    public func makePath() -> CGPath {
//        fatalError()
////        return CGPathCreateMutable()
//    }
//}
//
//public class ComponentArrow: AccidentalComponent {
//    
//    public override var description: String { get { return "Arrow" } }
//    
//    public var point = Point()
//    
//    public var direction: Direction = .none
//    
//    public var column: ComponentColumn?
//    
//    public var contractionStepSize: Double { get { return 0.25 * gS } }
//    
//    internal var top: Double { get { return point.y - 0.5 * height } }
//    internal var left: Double { get { return point.x - 0.5 * width } }
//    internal var width: Double { get { return 0.618 * gS } }
//    internal var height: Double { get { return 0.75 * gS } }
//    internal var barbDepth: Double { get { return 0.236 * gS } }
//    
//    public init(
//        staffSlotHeight: StaffSlotHeight,
//        scale: Double,
//        point: Point,
//        direction: Direction
//    )
//    {
//        self.point = point
//        self.direction = direction
//        super.init()
//        self.staffSlotHeight = staffSlotHeight
//        self.scale = scale
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    public override func makePath() -> CGPath {
//        frame = makeFrame()
//        let builder = Path.builder
//            .move(to: Point(x: 0.5 * width, y: 0))
//            .addLine(to: Point(x: width, y: height))
//            .addLine(to: Point(x: 0.5 * width, y: height - barbDepth))
//            .addLine(to: Point(x: 0, y: height))
//            .close()
//        let path = builder.build()
//        
//        if direction == .down {
//            return path.rotated(by: Angle(degrees: 180.0)).cgPath
//        }
//        
//        return path.cgPath
//    }
//    
//    public override func makeFrame() -> CGRect {
//        return CGRect(x: left, y: top, width: width, height: height)
//    }
//}
//
//public class ComponentBody: AccidentalComponent {
//    
//    public override var description: String { get { return "Body" } }
//    
//    public var point = Point()
//    
//    internal var yRef: Double { get { return 0 } }
//    internal var xRef: Double { get { return 0 } }
//    
//    public var midWidth: Double { get { return 0.575 * gS } }
//    public var flankWidth: Double { get { return 0.15 * gS } }
//    
//    public var thickLineSlope: Double = -0.25
//    public var thickLineWidth: Double { get { return 0.382 * gS } }
//    public var thickLineLength: Double { get { return midWidth + 2 * flankWidth } }
//    
//    public var thickLineΔY: Double { get { return 0.4125 * gS } }
//    
//    internal var width: Double { get { return 0 } }
//    internal var height: Double { get { return 0 } }
//    
//    public func getYAtX(x: Double) -> Double {
//        // mx + b
//        return yRef - thickLineSlope * (x - 0.5 * width)
//    }
//    
//    internal func getHeight() -> Double {
//        return 0 // override
//    }
//}
//
//public class ComponentBodyFlat: ComponentBody {
//    
//    internal override var width: Double { get { return midWidth } }
//    internal override var height: Double { get { return 1.25 * gS } }
//    
//    internal override var yRef: Double { get { return 0.4 * height } }
//    internal override var xRef: Double { get { return 0.5 * width } }
//    
//    public var bowlLineWidthTop: Double { get { return 0.1875 * gS } }
//    public var bowlLineWidthBottom: Double { get { return 0.382 * gS } }
//    public var bowlLineWidthStress: Double { get { return 0.25 * gS } }
//    
//    public init(staffSlotHeight: StaffSlotHeight, scale: Double, point: Point) {
//        super.init()
//        self.point = point
//        self.staffSlotHeight = staffSlotHeight
//        self.scale = scale
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    public override func makePath() -> CGPath {
//        frame = makeFrame()
//        
//        let builder = Path.builder
//            .move(to: Point())
//            .addCurve(to: Point(x: width, y: 0),
//                control1: Point(),
//                control2: Point(x: width - 0.125 * gS, y: -0.125 * gS)
//            )
//            .addCurve(to: Point(x: 0, y: height),
//                control1: Point(x: width + 0.25 * gS, y: 0.309 * gS),
//                control2: Point(x: 0.125 * gS, y: height - 0.33 * gS)
//            )
//            .addLine(to: Point(x: 0, y: height - bowlLineWidthBottom))
//            .addCurve(
//                to: Point(x: width - bowlLineWidthStress, y: 0.75 * bowlLineWidthStress),
//                control1: Point(x:
//                    0.5 * bowlLineWidthBottom,
//                    y: height - 1.25 * bowlLineWidthBottom
//                ),
//                control2: Point(
//                    x: width - 0.5 * bowlLineWidthBottom,
//                    y: 1.333 * bowlLineWidthStress
//                )
//            )
//            .addCurve(to: Point(x: 0, y: bowlLineWidthTop),
//                control1: Point(
//                    x: width - 1.309 * bowlLineWidthStress,
//                    y: 0.309 * bowlLineWidthStress
//                ),
//                control2: Point(x: 0, y: bowlLineWidthTop)
//            )
//            .close()
//            
//        return builder.build().cgPath
//    }
//    
//    public override func makeFrame() -> CGRect {
//        return CGRect(x: point.x - xRef, y: point.y - yRef, width: width, height: height)
//    }
//}
//
//public class ComponentBodyNatural: ComponentBody {
//    
//    internal override var width: Double { get { return thickLineLength } }
//    internal override var height: Double { get { return getHeight() } }
//    
//    internal override var yRef: Double { get { return 0.5 * height } }
//    internal override var xRef: Double { get { return 0.5 * width } }
//    
//    public override var thickLineLength: Double { get { return midWidth + thinLineWidth } }
//    
//    public init(staffSlotHeight: StaffSlotHeight, scale: Double, point: Point) {
//        super.init()
//        self.point = point
//        self.staffSlotHeight = staffSlotHeight
//        self.scale = scale
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    public override func makePath() -> CGPath {
//        frame = makeFrame()
//        
//        let a = Path.parallelogram(
//            center: Point(x: xRef, y: yRef - thickLineΔY),
//            height: thickLineWidth,
//            width: thickLineLength,
//            slope: thickLineSlope
//        )
//        
//        let b = Path.parallelogram(
//            center: Point(x: xRef, y: yRef + thickLineΔY),
//            height: thickLineWidth,
//            width: thickLineLength,
//            slope: thickLineSlope
//        )
//        
//        return (a+b).cgPath
//    }
//    
//    public override func makeFrame() -> CGRect {
//        return CGRect(x: point.x - xRef, y: point.y - yRef, width: width, height: height)
//    }
//    
//    internal override func getHeight() -> Double {
//        return 2 * thickLineΔY + thickLineWidth + thickLineSlope * width
//    }
//}
//
//public class ComponentBodyQuarterFlat: ComponentBodyFlat {
//
////    
////    public func build() {
////        frame = makeFrame()
////        mirrorPath()
////        setVisualAttributes()
////    }
//    
//    internal func mirrorPath() {
//        fatalError()
////        path = makePath()
////        let mirroredPath = UIBezierPath(CGPath: path!)
////        mirroredPath.mirror()
////        let adjustToTheLeft = CGAffineTransformMakeTranslation(-0.05 * gS, 0)
////        mirroredPath.applyTransform(adjustToTheLeft)
////        path = mirroredPath.CGPath
//    }
//}
//
//public class ComponentBodyQuarterSharp: ComponentBody {
//    
//    internal override var width: Double { get { return thickLineLength } }
//    internal override var height: Double { get { return getHeight() } }
//    
//    internal override var yRef: Double { get { return 0.5 * height } }
//    internal override var xRef: Double { get { return 0.5 * width } }
//    
//    public init(staffSlotHeight: StaffSlotHeight, scale: Double, point: Point) {
//        super.init()
//        self.point = point
//        self.staffSlotHeight = staffSlotHeight
//        self.scale = scale
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    public override func makePath() -> CGPath {
//        frame = makeFrame()
//        fatalError()
////        
////        let path = ParallelogramVertical(
////            x: xRef,
////            y: yRef,
////            width: thickLineWidth,
////            length: thickLineLength,
////            slope: thickLineSlope
////        )
////        return path.CGPath
//    }
//    
//    public override func makeFrame() -> CGRect {
//        return CGRect(x: point.x - xRef, y: point.y - yRef, width: width, height: height)
//    }
//    
//    internal override func getHeight() -> Double {
//        return thickLineWidth + thickLineSlope * width
//    }
//}
//
//public class ComponentBodySharp: ComponentBody {
//    
//    internal override var width: Double { get { return thickLineLength } }
//    internal override var height: Double { get { return getHeight() } }
//    
//    internal override var yRef: Double { get { return 0.5 * height } }
//    internal override var xRef: Double { get { return 0.5 * width } }
//    
//    public init(staffSlotHeight: StaffSlotHeight, scale: Double, point: Point) {
//        super.init()
//        self.point = point
//        self.staffSlotHeight = staffSlotHeight
//        self.scale = scale
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    public override func makePath() -> CGPath {
//        
//        let a = Path.parallelogram(
//            center: Point(x: xRef, y: yRef - thickLineΔY),
//            height: thickLineWidth,
//            width: thickLineLength,
//            slope: thickLineSlope
//        )
//        
//        let b = Path.parallelogram(
//            center: Point(x: xRef, y: yRef + thickLineΔY),
//            height: thickLineWidth,
//            width: thickLineLength,
//            slope: thickLineSlope
//        )
//        
//        return (a+b).cgPath
//    }
//    
//    public override func makeFrame() -> CGRect {
//        return CGRect(x: point.x - xRef, y: point.y - yRef, width: width, height: height)
//    }
//    
//    internal override func getHeight() -> Double {
//        return 2 * thickLineΔY + thickLineWidth + thickLineSlope * width
//    }
//}
//
//public class ComponentColumn: AccidentalComponent {
//    
//    public override var description: String { get { return "Column" } }
//    
//    public var width: Double { get { return 0.0875 * gS } }
//    
//    public var x: Double = 0
//    public var y_internal: Double = 0
//    public var y_external: Double = 0
//    
//    internal var top: Double = 0
//    internal var left: Double = 0
//    internal var height: Double { get { return abs(y_internal - y_external) } }
//    
//    public var direction: Direction = .none // default?
//    
//    public var arrow: ComponentArrow?
//    
//    public init(
//        staffSlotHeight: StaffSlotHeight,
//        scale: Double,
//        x: Double,
//        y_internal: Double,
//        y_external: Double
//    )
//    {
//        self.y_internal = y_internal
//        self.y_external = y_external
//        self.x = x
//        self.direction = y_external > y_internal ? .down : .up
//        super.init()
//        self.staffSlotHeight = staffSlotHeight
//        self.scale = scale
//        build()
//    }
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    /*
//    public override init(layer: AnyObject) {
//        super.init(layer: layer)
//    }
//    */
//    
////    
////    public override func build() {
////        frame = makeFrame()
////        path = makePath()
////        setVisualAttributes()
////    }
//    
//    public override func makePath() -> CGPath {
//        return Path.rectangle(Rectangle(bounds)).cgPath
//    }
//    
//    public override func makeFrame() -> CGRect {
//        let left: Double = x - 0.5 * width
//        let top: Double = y_external < y_internal ? y_external : y_internal
//        return CGRect(x: left, y: top, width: width, height: height)
//    }
//}
//
//public class ComponentDyad: CustomStringConvertible {
//    
//    public var description: String { get { return getDescription() } }
//    
//    public var component0: AccidentalComponent
//    public var component1: AccidentalComponent
//    
//    public init(component0: AccidentalComponent, component1: AccidentalComponent) {
//        self.component0 = component0
//        self.component1 = component1
//    }
//    
//    internal func getDescription() -> String {
//        let description: String = "\(component0, component1)"
//        return description
//    }
//}
