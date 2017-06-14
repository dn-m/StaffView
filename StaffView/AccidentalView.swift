
//
//  AccidentalView.swift
//  StaffView
//
//  Created by James Bean on 8/18/15.
//  Copyright © 2015 James Bean. All rights reserved.
//

import QuartzCore
import GeometryTools
import GraphicsTools
import StaffModel

// TODO: Make protocol
// TODO: Utilize CALayer.anchorPoint property
public class AccidentalView: CALayer, CompositeShapeType {
    
    /**
     Position of the .
     
     > `y` value generally being on a staff line, or equidistance between two.
     >
     > `x` values of a column of accidentals are aligned.
    */
    public let point: Point
    
    /// Graphical height of a single Guidonian staff space
    public let staffSlotHeight: StaffSlotHeight
    
    /// Scale.
    public let scale: Double
    
    /// - FIXME: This is awful.
    public var gS: Double {
        return Double(staffSlotHeight) * scale
    }
    
    internal var xRef: Double {
        fatalError()
    }
    
    internal var yRef: Double {
        fatalError()
    }
    
    internal var left: Double {
        fatalError()
    }
    
    internal var top: Double  {
        fatalError()
    }
    
    internal var width: Double  {
        fatalError()
    }
    
    internal var height: Double  {
        fatalError()
    }
    
    public var boundingWidth: Double? {
        return getBoundingWidth()
    }
    
    // for sharp types
    public var midWidth: Double { get { return 0.575 * gS } }
    public var flankWidth: Double { get { return 0.15 * gS } }

    public var thinLineWidth: Double { get { return 0.0875 * gS } }
    
    // arrow having types
    public var arrowHeight: Double { get { return 0.618 * gS } }
    
    public var column: Int?
    
    public var components: [CALayer] = []
    
    public var body: ComponentBody?
    
    public var column_left_up: ComponentColumn?
    public var column_left_down: ComponentColumn?
    
    public var column_center_up: ComponentColumn?
    public var column_center_down: ComponentColumn?
    
    public var column_right_up: ComponentColumn?
    public var column_right_down: ComponentColumn?
    
    public var arrow_left_up: ComponentArrow?
    public var arrow_left_down: ComponentArrow?
    
    public var arrow_center_up: ComponentArrow?
    public var arrow_center_down: ComponentArrow?
    
    public var arrow_right_up: ComponentArrow?
    public var arrow_right_down: ComponentArrow?
    
    public var color: Color = Color(gray: 0.85, alpha: 1) {
        
        didSet {
            self.components
                .flatMap { $0 as? CAShapeLayer }
                .forEach { $0.fillColor = color.cgColor }
        }
    }

    /// - FIXME: `staffSlotHeight` _was_ `staffspaceHeight` (2x the size)
    public required init(point: Point, staffSlotHeight: StaffSlotHeight, scale: Double) {
        self.point = point
        self.staffSlotHeight = 2 * staffSlotHeight // TEMP
        self.scale = scale
        super.init()
        build()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public func createComponents() {
        
    }
    
    public func commitComponents() {
        components.forEach(addSublayer)
    }
    
    public func makeFrame() -> CGRect {
        let left = point.x - xRef
        let top = point.y - yRef
        return CGRect(x: left, y: top, width: width, height: height)
    }
    
    private func getHeight() -> CGFloat {
        let minY: CGFloat = getMinY(components)
        let maxY: CGFloat = getMaxY(components)
        let height: CGFloat = -minY + maxY
        return height
    }
    
    internal func getBoundingWidth() -> Double? {
        
        guard !components.isEmpty else {
            return nil
        }
        
        let min = Double(components.map { $0.frame.minX }.min()!)
        let max = Double(components.map { $0.frame.maxX }.max()!)
        return max - min
    }
    
    // abstract these for more global usage with CALayers
    internal func getMinY(_ layers: [CALayer]) -> CGFloat {
        var newLayers: [CALayer] = layers
        newLayers.sort { $0.frame.minY < $1.frame.minY }
        return newLayers.first!.frame.minY
    }
    
    internal func getMaxY(_ layers: [CALayer]) -> CGFloat {
        var newLayers: [CALayer] = layers
        newLayers.sort { $0.frame.maxX > $1.frame.maxX }
        return newLayers.first!.frame.maxY
    }
}

extension AccidentalView {
    
    public static func makeAccidental(
        _ kind: Accidental,
        at point: Point,
        staffSlotHeight: StaffSlotHeight,
        scale: Double = 1
    ) -> AccidentalView
    {
        var classType: AccidentalView.Type {
            switch kind {
            case .natural: return Natural.self
            case .naturalUp: return NaturalUp.self
            case .naturalDown: return NaturalDown.self
            case .sharp: return Sharp.self
            case .sharpUp: return SharpUp.self
            case .sharpDown: return SharpDown.self
            case .flat: return Flat.self
            case .flatUp: return FlatUp.self
            case .flatDown: return FlatDown.self
            case .quarterSharp: return QuarterSharp.self
            case .quarterSharpUp: return QuarterSharpUp.self
            case .quarterSharpDown: return QuarterSharpDown.self
            case .quarterFlat: return QuarterFlat.self
            case .quarterFlatUp: return QuarterFlatUp.self
            case .quarterFlatDown: return QuarterFlatDown.self
            }
        }
        return classType.init(point: point, staffSlotHeight: staffSlotHeight, scale: scale)
    }
    
    public static func makeAccidental(
        coarse: Float,
        fine: Float,
        at point: Point,
        staffSlotHeight: StaffSlotHeight,
        scale: Double = 1
    ) -> AccidentalView?
    {
        
        guard let kind = Accidental(coarse: coarse, fine: fine) else {
            return nil
        }
        
        return makeAccidental(kind,
            at: point,
            staffSlotHeight: staffSlotHeight,
            scale: scale
        )
    }
}
