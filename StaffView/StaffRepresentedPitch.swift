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
            point: Point(x: 0, y: self.altitude),
            staffSlotHeight: self.staffSlotHeight
        )
        
        self.accidental = AccidentalView.makeAccidental(self.representableContext.accidental,
            at: Point(x: 0, y: self.altitude),
            staffSlotHeight: self.staffSlotHeight
        )
        
        print("accidental.frame: \(accidental!.frame)")
    }
}
