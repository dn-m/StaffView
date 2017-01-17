//
//  StaffStructureConfiguration.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import StaffModel
import GraphicsTools

public struct StaffStructureConfiguration {
 
    public let staffSlotHeight: StaffSlotHeight
    public let linesColor: Color
    
    var ledgerLineWidth: StaffSlotHeight {
        return 0.175 * staffSlotHeight
    }
    
    var lineWidth: StaffSlotHeight {
        return 0.1 * staffSlotHeight
    }
    
    var ledgerLineLength: StaffSlotHeight {
        return 3 * staffSlotHeight
    }
    
    public init(
        staffSlotHeight: StaffSlotHeight = 12,
        linesColor: Color = Color.init(gray: 0.5, alpha: 1)
    )
    {
        self.staffSlotHeight = staffSlotHeight
        self.linesColor = linesColor
    }
}
