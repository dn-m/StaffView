//
//  QuarterSharpUp.swift
//  Staff
//
//  Created by James Bean on 6/14/16.
//
//

import GeometryTools

public class QuarterSharpUp: QuarterSharp {
    
    public override var description: String { return "quarterSharpUp" }
    
    public override var column_up_height: Double { return  2 * gS }
    
    internal override var height: Double {
        return column_up_height + column_down_height + 0.5 * arrowHeight
    }
    
    internal override var width: Double { return thickLineLength }
    
    internal override var yRef: Double { return column_up_height + 0.5 * arrowHeight }
    
    public override func createComponents() {
        addBody()
        addColumnUp()
        addColumnDown()
        addArrow()
    }
    
    internal func addArrow() {
        arrow_center_up = ComponentArrow(
            staffSlotHeight: staffSlotHeight,
            scale: scale,
            point: Point(x: xRef, y: yRef - column_up_height),
            direction: .up
        )
        components.append(arrow_center_up!)
        arrow_center_up!.column = column_center_up
        arrow_center_up!.alignment = .center
    }
}
