//
//  StaffViewConfiguration.swift
//  StaffView
//
//  Created by James Bean on 1/17/17.
//
//

import StaffModel

public struct StaffViewConfiguration {
    
    let staffSlotHeight: StaffSlotHeight
    
    public init(staffSlotHeight: StaffSlotHeight = 12) {
        self.staffSlotHeight = staffSlotHeight
    }
}
