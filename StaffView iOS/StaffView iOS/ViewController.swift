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
        
        let layer = CALayer()

        //let pitch: Pitch = 60
        //let collection: PitchCollection = [60, 61, 62, 63]
        let set: PitchSet = [57, 66, 81]
        
        set.show(in: layer)
        layer.position.x += 200
        layer.position.y += 200
        view.layer.addSublayer(layer)
    }
}
