//
//  GameViewController.swift
//  SpriteKitDemo
//
//  Created by Klaus Fischer on 27.11.20.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "MyFirstTileMapScene"){
            // Set the scale mode to scale to fit the window
                scene.scaleMode = .fill
                //scene.size = UIScreen.main.bounds.size

            // Present the scene
            view.presentScene(scene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            view.showsPhysics = true
            }
        }
    }
}
