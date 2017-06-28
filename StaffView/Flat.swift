////
////  Flat.swift
////  Staff
////
////  Created by James Bean on 6/14/16.
////
////
//
//import GeometryTools
//
//public class Flat: AccidentalView {
//    
//    public override var description: String { return "flat" }
//    
//    internal var column_up_height: Double { return 1.618 * gS }
//    internal var column_down_height: Double { return 0.75 * gS }
//    
//    internal override var height: Double {
//        get { return column_up_height + column_down_height }
//    }
//    
//    internal override var width: Double { return midWidth }
//    internal override var xRef: Double { return 0.5 * midWidth }
//    internal override var yRef: Double { return column_up_height }
//    
//    public override func createComponents() {
//        addBody()
//        addColumnUp()
//        addColumnDown()
//    }
//    
//    internal func addBody() {
//        body = ComponentBodyFlat(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            point: Point(x: xRef + 0.4 * thinLineWidth, y: yRef)
//        )
//        components.append(body!)
//    }
//    
//    internal func addColumnUp() {
//        column_left_up = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: 0,
//            y_internal: yRef,
//            y_external: yRef - column_up_height
//        )
//        components.append(column_left_up!)
//        column_left_up!.alignment = .right
//    }
//    
//    internal func addColumnDown() {
//        column_left_down = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: 0,
//            y_internal: yRef,
//            y_external: yRef + column_down_height
//        )
//        components.append(column_left_down!)
//        column_left_down!.alignment = .left
//    }
//}
