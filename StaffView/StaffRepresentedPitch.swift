//
//  StaffRepresentedPitch.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import GeometryTools
import GraphicsTools

/// TODO: Add configuration
public struct StaffRepresentedPitch {
    
    private let representableContext: StaffRepresentablePitch
    private let altitude: Double
    private let staffSlotHeight: StaffSlotHeight
    
    public let notehead: NoteheadView?
    public let accidental: AccidentalView?
    
    public init(
        representableContext: StaffRepresentablePitch,
        altitude: Double,
        staffSlotHeight: StaffSlotHeight
    )
    {
        self.representableContext = representableContext
        self.altitude = altitude
        self.staffSlotHeight = staffSlotHeight
        
        self.notehead = NoteheadView(
            position: Point(x: 0, y: altitude),
            size: NoteheadView.Size(staffSlotHeight: staffSlotHeight, scale: 1)
        )
        
        self.accidental = AccidentalView(
            position: Point(x: -30, y: altitude),
            size: AccidentalView.Size(staffSlotHeight: staffSlotHeight, scale: 1),
            color: .black
        )
    }
}
