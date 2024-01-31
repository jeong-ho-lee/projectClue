//
//  GameViewController.swift
//  Clue
//
//  Created by 김선호 on 1/14/24.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var textValue: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
