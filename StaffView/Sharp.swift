//
//  Sharp.swift
//  Staff
//
//  Created by James Bean on 6/14/16.
//
//

import GeometryTools
import PathTools
import GraphicsTools

public class Sharp: AccidentalView {
    
    var left: Double {
        return 0
    }
    
    var outsideLeft: Double {
        return flankWidth
    }
    
    var insideLeft: Double {
        return flankWidth + thinLineWidth
    }
    
    var outsideRight: Double {
        return width - flankWidth
    }
    
    var insideRight: Double {
        return width - flankWidth - thinLineWidth
    }
    
    var right: Double {
        return width
    }
    
    private var outside: Path {
        
        let builder = Path.builder
            .move(to: Point(x: flankWidth, y: centerReference.y - shortColumnHeight))
            .addLine(to: Point(x: insideLeft, y: centerReference.y - shortColumnHeight))
            .addLine(to: point(x: insideLeft, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: insideRight, displace: -thickLineDisplace, from: .above))
            .addLine(to: Point(x: insideRight, y: 0))
            .addLine(to: Point(x: outsideRight, y: 0))
            .addLine(to: point(x: outsideRight, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: width, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: outsideRight, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: outsideRight, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: right, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: outsideRight, displace: thickLineDisplace, from: .below))
            .addLine(to: Point(x: outsideRight, y: centerReference.y + shortColumnHeight))
            .addLine(to: Point(x: insideRight, y: centerReference.y + shortColumnHeight))
            .addLine(to: point(x: insideRight, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: insideLeft, displace: thickLineDisplace, from: .below))
            .addLine(to: Point(x: insideLeft, y: height))
            .addLine(to: Point(x: outsideLeft, y: height))
            .addLine(to: point(x: outsideLeft, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: outsideLeft, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: outsideLeft, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: left, displace: -thickLineDisplace, from: .above))
            .addLine(to: point(x: outsideLeft, displace: -thickLineDisplace, from: .above))
            .close()
        
        return builder.build()
    }
    
    private var inside: Path {
        
        let builder = Path.builder
            .move(to: point(x: insideLeft, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: insideRight, displace: -thickLineDisplace, from: .below))
            .addLine(to: point(x: insideRight, displace: thickLineDisplace, from: .above))
            .addLine(to: point(x: insideLeft, displace: thickLineDisplace, from: .above))
            .close()
        
        return builder.build()
    }
    
    public override var path: Path {
        return outside + inside
    }
    
    public var tallColumnHeight: Double {
        return 2.1 * size
    }
    
    public var shortColumnHeight: Double {
        return 1.9 * size
    }
    
    override var height: Double {
        return 2 * tallColumnHeight
    }
    
    override var width: Double {
        return midWidth + 2 * flankWidth
    }
}
//
//public class Sharp: AccidentalView, SharpType {
//    
//    public override var description: String { return "sharp" }
//    
//    internal var column_left_up_height: Double { return 0.95 * gS }
//    internal var column_left_down_height: Double { return 1.05 * gS }
//    internal var column_right_up_height: Double { return 1.05 * gS }
//    internal var column_right_down_height: Double { return 0.95 * gS }
//    
//    
//    internal override var height: Double {
//        get { return column_right_up_height + column_left_down_height }
//    }
//    
//    internal override var width: Double { get { return thickLineLength } }
//    
//    internal override var xRef: Double { get { return 0.5 * width } }
//    internal override var yRef: Double { get { return 0.5 * height } }
//    
//    public override func createComponents() {
//        addBody()
//        addColumnLeftUp()
//        addColumnLeftDown()
//        addColumnRightUp()
//        addColumnRightDown()
//    }
//    
//    internal func addBody() {
//        body = ComponentBodySharp(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            point: Point(x: xRef, y: yRef)
//        )
//        components.append(body!)
//    }
//    
//    internal func addColumnLeftUp() {
//        column_left_up = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef - 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef - column_left_up_height
//        )
//        components.append(column_left_up!)
//        column_left_up!.alignment = .left
//    }
//    
//    internal func addColumnLeftDown() {
//        column_left_down = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef - 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef + column_left_down_height
//        )
//        components.append(column_left_down!)
//        column_left_down!.alignment = .left
//    }
//    
//    internal func addColumnRightUp() {
//        column_right_up = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef + 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef - column_right_up_height
//        )
//        components.append(column_right_up!)
//        column_right_up!.alignment = .right
//    }
//    
//    internal func addColumnRightDown() {
//        column_right_down = ComponentColumn(
//            staffSlotHeight: staffSlotHeight,
//            scale: scale,
//            x: xRef + 0.5 * midWidth,
//            y_internal: yRef,
//            y_external: yRef + column_right_down_height
//        )
//        components.append(column_right_down!)
//        column_right_down!.alignment = .right
//    }
//}
//
