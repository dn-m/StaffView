////
////  Natural.swift
////  Staff
////
////  Created by James Bean on 6/14/16.
////
////
//
//import GeometryTools
//import QuartzCore
//
//public class Natural: AccidentalView {
//    
//    public override var description: String { return "natural" }
//    
//    internal var column_left_up_height: Double {  return 1.236 * gS }
//    internal var column_right_down_height: Double { return 1.236 * gS }
//    
//    internal override var height: Double {
//        return column_left_up_height + column_right_down_height
//    }
//    
//    internal override var width: Double {
//        return midWidth + thinLineWidth
//    }
//    
//    internal override var xRef: Double {
//        return 0.5 * width
//    }
//    
//    internal override var yRef: Double {
//        return column_left_up_height
//    }
//    
//    public override func createComponents() {
//        addBody()
//        addLeftColumnUp()
//        addLeftColumnDown()
//        addRightColumnDown()
//        addRightColumnUp()
//    }
//    
//    internal func addBody() {
//        body = ComponentBodyNatural(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            point: Point(x: xRef, y: yRef)
//        )
//        components.append(body!)
//    }
//    
//    internal func addLeftColumnDown() {
//        column_left_down = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef - 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef + 0.5 * gS
//        )
//        column_left_down!.alignment = .left
//        components.append(column_left_down!)
//    }
//    
//    internal func addLeftColumnUp() {
//        column_left_up = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef - 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef - column_left_up_height
//        )
//        column_left_up!.alignment = .left
//        components.append(column_left_up!)
//    }
//    
//    internal func addRightColumnDown() {
//        column_right_down = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef + 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef + column_right_down_height
//        )
//        column_right_down!.alignment = .right
//        components.append(column_right_down!)
//    }
//    
//    internal func addRightColumnUp() {
//        column_right_up = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef + 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef - 0.5 * gS
//        )
//        components.append(column_right_up!)
//        column_right_up!.alignment = .right
//    }
//    
//    override public func makeFrame() -> CGRect {
//        
//        //print("makeFrame: x: \(point.x); xRef: \(xRef); y: \(point.y); yRef: \(yRef)")
//        
//        let frames = components.map { $0.frame }
//        
//        let minX = frames.map { $0.minX }.min()!
//        let maxX = frames.map { $0.maxX }.max()!
//        let minY = frames.map { $0.minY }.min()!
//        let maxY = frames.map { $0.maxY }.max()!
//        let width = maxX - minX
//        let height = maxY - minY
//        
//        return CGRect(
//            x: CGFloat(point.x) - minX - CGFloat(xRef),
//            y: CGFloat(point.y) - minY - CGFloat(yRef),
//            width: width,
//            height: height
//        )
//    }
//}
