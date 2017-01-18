//
//  StaffRepresentedPitch.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import GraphicsTools
import StaffModel
import QuartzCore

public struct StaffRepresentedPitch {
    
    private let representableContext: StaffRepresentablePitch
    private let altitude: CGFloat
    private let staffSlotHeight: StaffSlotHeight
    
    public let notehead: NoteheadView?
    public let accidental: AccidentalView?
    
    public init(
        representableContext: StaffRepresentablePitch,
        altitude: CGFloat, // calculate altitude within staffEvent?
        staffSlotHeight: StaffSlotHeight
    )
    {
        self.representableContext = representableContext
        self.altitude = altitude
        self.staffSlotHeight = staffSlotHeight
        
        self.notehead = NoteheadView(
            point: CGPoint(x: 0, y: self.altitude),
            staffSlotHeight: self.staffSlotHeight
        )
        
        self.accidental = AccidentalView.makeAccidental(
            withKind: self.representableContext.accidental,
            point: CGPoint(x: 0, y: self.altitude),
            staffSlotHeight: self.staffSlotHeight
        )
        
        accidental?.color = Color.red
    }
}
