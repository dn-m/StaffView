//
//  ViewController.swift
//  StaffView iOS
//
//  Created by James Bean on 1/18/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import UIKit
import Pitch
import PitchSpellingTools
import StaffModel
import StaffView
import GraphicsTools

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var model = StaffModel(clef: Clef(.treble))
        let pitches: [Pitch] = [60,61,62,63]
        let points = pitches
            .map { try! $0.spelledWithDefaultSpelling() }
            .map { StaffRepresentablePitch($0) }
            .map { StaffPointModel([$0]) }
            
        
        let positions: [Double] = [100, 200, 300, 400]
            
        zip(positions, points).forEach { position, point in
            model.addPoint(point, at: position)
        }
        
        let staffView = StaffView(model: model)
        
        let config = StaffViewConfiguration(staffSlotHeight: 12)
        staffView.render(in: staffView, with: config)
        staffView.position.x += 100
        staffView.position.y += 100
        view.layer.addSublayer(staffView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

