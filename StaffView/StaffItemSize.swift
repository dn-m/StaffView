//
//  StaffItemSize.swift
//  StaffView
//
//  Created by James Bean on 6/30/17.
//
//

public struct StaffItemSize {
    
    public let staffSlotHeight: StaffSlotHeight
    public let scale: Double
    
    public init(staffSlotHeight: StaffSlotHeight = 12, scale: Double = 1) {
        self.staffSlotHeight = staffSlotHeight
        self.scale = scale
    }
}

internal func * (lhs: Double, rhs: StaffItemSize) -> Double {
    return lhs * rhs.staffSlotHeight * rhs.scale
}

internal func * (lhs: StaffItemSize, rhs: Double) -> Double {
    return rhs * lhs.staffSlotHeight * lhs.scale
}
