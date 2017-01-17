//
//  StaffInformationConfiguration.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import GraphicsTools

public struct StaffInformationConfiguration {

    public let staffSlotHeight: StaffSlotHeight
    public let noteheadColor: Color
    
    public init(staffSlotHeight: StaffSlotHeight, noteheadColor: Color) {
        self.staffSlotHeight = staffSlotHeight
        self.noteheadColor = noteheadColor
    }
}
