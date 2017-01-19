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
        
        let pitch: Pitch = 60
        let layer = CALayer()
        pitch.show(in: layer)
        layer.position.x = view.frame.midX
        layer.position.y = view.frame.midY
        view.layer.addSublayer(layer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
