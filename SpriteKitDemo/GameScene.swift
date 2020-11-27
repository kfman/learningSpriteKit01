//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Klaus Fischer on 27.11.20.
//

import SpriteKit

class GameScene: SKScene {
    
    let dogSpriteNode = SKSpriteNode(imageNamed: "Run0")
    var dogFrames = [SKTexture]()
    
    override func didMove(to view: SKView) {
        dogSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(dogSpriteNode)
        
        let textureAtlas = SKTextureAtlas(named: "Dog Frames")
        for index in 0..<textureAtlas.textureNames.count{
            let textureName = "Run\(index)"
            dogFrames.append(textureAtlas.textureNamed(textureName))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !dogSpriteNode.hasActions(){
            dogSpriteNode.run(SKAction.repeatForever(SKAction.animate(with: dogFrames, timePerFrame: 0.1)))
        }
        else{
            dogSpriteNode.removeAllActions()
        }
    }
    
    /*
    override func update(_ currentTime: TimeInterval) {
        print("1")
    }
    
    override func didEvaluateActions() {
        print("2")
    }
    
    override func didSimulatePhysics() {
        print("3")
    }
    
    override func didApplyConstraints() {
        print("4")
    }
    
    override func didFinishUpdate() {
        print("5")
        isPaused = true
    }
 */
}

