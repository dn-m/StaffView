////
////  NaturalDown.swift
////  Staff
////
////  Created by James Bean on 6/14/16.
////
////
//
//import GeometryTools
//
//public class NaturalDown: Natural {
//    
//    public override var description: String { get { return "naturalDown" } }
//    
//    internal override var column_right_down_height: Double { return 2 * gS }
//    
//    internal override var height: Double {
//        return column_left_up_height + column_right_down_height + 0.5 * arrowHeight
//    }
//    
//    internal override var xRef: Double { return 0.5 * width }
//    internal override var yRef: Double { return column_left_up_height }
//    
//    public override func createComponents() {
//        addBody()
//        addLeftColumnUp()
//        addLeftColumnDown()
//        addRightColumnDown()
//        addRightColumnUp()
//        addArrow()
//    }
//    
//    internal func addArrow() {
//        arrow_right_down = ComponentArrow(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            point: Point(x: xRef + 0.5 * midWidth, y: yRef + column_right_down_height),
//            direction: .down
//        )
//        components.append(arrow_right_down!)
//        arrow_right_down!.column = column_right_down
//        arrow_right_down!.alignment = .right
//    }
//}
//
