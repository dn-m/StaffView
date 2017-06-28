//
//  NoteheadView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import QuartzCore
import GeometryTools
import PathTools
import GraphicsTools

public class NoteheadView: Renderable {

    public var rendered: StyledPath.Composite {
        let styling = Styling(fill: Fill(color: Color(gray: 0.5, alpha: 1)))
        return .leaf(StyledPath(frame: frame, path: path, styling: styling))
    }
    
    private var path: Path {
        return Path
            .ellipse(in: Rectangle(x: 0, y: 0, width: width, height: height))
            .rotated(by: Angle(degrees: 45), around: Point(x: 0.5 * width, y: 0.5 * height))
    }
    
    private var frame: Rectangle {
        return Rectangle(
            x: point.x - 0.5 * width,
            y: point.y - 0.5 * height,
            width: width,
            height: height
        )
    }
    
    private var width: Double {
        return 2.25 * staffSlotHeight * scale
    }
    
    private var height: Double {
        return 0.75 * width * scale
    }
    
    public var point: Point
    
    // FIXME: Get rid of this knowledge
    public var staffSlotHeight: StaffSlotHeight
    
    public var scale: Double
    
    // Add configuration
    public init(point: Point, staffSlotHeight: StaffSlotHeight, scale: Double = 1) {
        self.point = point
        self.staffSlotHeight = staffSlotHeight
        self.scale = scale
    }
}
