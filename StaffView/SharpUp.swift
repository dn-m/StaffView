////
////  SharpUp.swift
////  Staff
////
////  Created by James Bean on 6/14/16.
////
////
//
//import GeometryTools
//
//public class SharpUp: Sharp {
//    
//    public override var description: String { get { return "sharpUp" } }
//    
//    internal override var column_right_up_height: Double { return 2 * gS }
//    
//    internal override var height: Double {
//        return column_right_up_height + column_left_down_height + 0.5 * arrowHeight
//    }
//    
//    internal override var width: Double { get { return thickLineLength } }
//    
//    internal override var xRef: Double { get { return 0.5 * thickLineLength } }
//    internal override var yRef: Double {
//        get { return column_right_up_height + 0.5 * arrowHeight }
//    }
//    
//    public override func createComponents() {
//        addBody()
//        addColumnLeftUp()
//        addColumnLeftDown()
//        addColumnRightUp()
//        addColumnRightDown()
//        addArrowUp()
//    }
//    
//    internal func addArrowUp() {
//        arrow_right_up = ComponentArrow(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            point: Point(x: xRef + 0.5 * midWidth, y: yRef - column_right_up_height),
//            direction: .up
//        )
//        components.append(arrow_right_up!)
//        arrow_right_up!.column = column_left_up
//        arrow_right_up!.alignment = .right
//    }
//}
