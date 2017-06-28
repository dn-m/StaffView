////
////  QuarterSharpDown.swift
////  Staff
////
////  Created by James Bean on 6/14/16.
////
////
//
//import GeometryTools
//
//public class QuarterSharpDown: QuarterSharp {
//    
//    public override var description: String { get { return "quarterSharpDown" } }
//    
//    public override var column_down_height: Double { get { return 2 * gS } }
//    
//    internal override var height: Double {
//        return column_up_height + column_down_height + 0.5 * arrowHeight
//    }
//    
//    internal override var width: Double { get { return thickLineLength } }
//    
//    internal override var yRef: Double { get { return column_up_height } }
//    
//    public override func createComponents() {
//        addBody()
//        addColumnUp()
//        addColumnDown()
//        addArrow()
//    }
//    
//    internal func addArrow() {
//        arrow_center_down = ComponentArrow(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            point: Point(x: xRef, y: yRef + column_down_height),
//            direction: .down
//        )
//        components.append(arrow_center_down!)
//        arrow_center_down!.column = column_center_down
//        arrow_center_down!.alignment = .center
//    }
//}
