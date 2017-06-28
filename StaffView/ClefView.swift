//
//  ClefView.swift
//  StaffView
//
//  Created by James Bean on 1/16/17.
//
//

import GeometryTools
import PathTools
import GraphicsTools
import PlotView
import StaffModel

// TODO: Move to dn-m/PlotView
public struct ClefConfiguration {
    public var foregroundColor: Color
    public var maskColor: Color
}

// TODO: Move to dn-m/PlotView
public protocol ClefView: VerticalAxisView {
    
    typealias Configuration = ClefConfiguration
    
    var extenderLength: Double { get }
    var lineWidth: Double { get }
    
    var path: Path { get }
    
    var position: VerticalAxisPosition { get }
    var configuration: ClefConfiguration { get }
}

// TODO: Move to dn-m/PlotView
extension ClefView {
    
    public var clefHeight: Double {
        return abs(position.plotTop - position.plotBottom)
    }
    
    public var extenderLength: Double {
        return clefHeight / 8
    }
    
    public var height: Double {
        return clefHeight + 1 * extenderLength
    }
    
    public var lineWidth: Double {
        return 0.025 * clefHeight
    }

    public var line: Path {
        return Path.line(from: Point(x: 0, y: 0), to: Point(x: 0, y: height))
    }
    
    public var frame: Rectangle {
        return Rectangle(x: 0, y: -extenderLength, width: 0, height: height)
    }
    
    public var rendered: StyledPath.Composite {
        
        let styling = Styling(
            fill: Fill(color: configuration.maskColor),
            stroke: Stroke(width: lineWidth, color: configuration.foregroundColor)
        )
        
        return .leaf(StyledPath(frame: frame, path: path, styling: styling))
    }
}


public class StaffClefView: ClefView {
    
    public static func makeClef(_ kind: Clef.Kind, position: Position, configuration: Configuration)
        -> StaffClefView
    {
        
        var type: StaffClefView.Type {
            switch kind {
            case .bass:
                return TrebleClef.self
            case .tenor:
                return TenorClef.self
            case .alto:
                return AltoClef.self
            case .treble:
                return TrebleClef.self
            }
        }
        
        return type.init(position: position, configuration: configuration)
    }
    
    public var position: VerticalAxisPosition
    public var configuration: ClefConfiguration

    public var ornamentAltitude: Double {
        return 0
    }
    
    public var ornament: Path {
        return .unit
    }
    
    required public init(position: Position, configuration: Configuration) {
        self.position = position
        self.configuration = configuration
    }
}

extension StaffClefView {
    
    public var staffSlotHeight: Double {
        return clefHeight / 8
    }
    
    public var path: Path {
        return line + ornament
    }
}
