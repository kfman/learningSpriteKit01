//
//  GameScene.swift
//  SpriteKitDemo
//
//  Created by Klaus Fischer on 27.11.20.
//

import SpriteKit

class GameScene: SKScene {
    
    let myFirstNode = SKNode()
    let myFirstSpriteNode = SKSpriteNode(color:UIColor.red, size: CGSize(width: 200.0, height: 200.0))
    let myBlueSpriteNode = SKSpriteNode(color:UIColor.blue, size: CGSize(width: 100.0, height: 100.0))
    let spaceship = SKSpriteNode(imageNamed: "spaceship")
    
    override func didMove(to view: SKView) {
        addChild(myFirstNode)
        
        myFirstSpriteNode.position = CGPoint(x: frame.midX - 100, y: frame.midY - 150)
        myFirstSpriteNode.anchorPoint = CGPoint.zero
        addChild(myFirstSpriteNode)
        
        spaceship.size = CGSize(width: 100.0, height: 100.0)
        spaceship.zPosition = 1
        myFirstSpriteNode.addChild(spaceship)
        myBlueSpriteNode.position = CGPoint(x:myFirstSpriteNode.size.width / 2 , y:myFirstSpriteNode.size.height / 2)
        myBlueSpriteNode.zPosition = 2
        myFirstSpriteNode.addChild(myBlueSpriteNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
//        myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: myFirstSpriteNode.size.width,y: myFirstSpriteNode.size.height), duration: 2.0))
//
//        myBlueSpriteNode.run(SKAction.rotate(byAngle: .pi, duration: 2.0))
//        myFirstTexturedSpriteNode.run(SKAction.move(to: CGPoint(x: myFirstSpriteNode.size.width,y: myFirstSpriteNode.size.height),duration: 2.0)) {
//            self.myFirstTexturedSpriteNode.position = CGPoint.zero
//        }
//
//        if !myBlueSpriteNode.hasActions(){
//            myBlueSpriteNode.run(SKAction.repeatForever(
//                                    SKAction.rotate(byAngle: .pi, duration:  2.0)))
//            myBlueSpriteNode.run(SKAction.group([SKAction.rotate(byAngle: .pi, duration:  2.0),
//                                                 SKAction.scale(by: 0.9, duration: 2.0)))
//            myBlueSpriteNode.run(SKAction.sequence([
//                                                    SKAction.rotate(byAngle: .pi, duration:  0.5),
//                                                    SKAction.scale(by: 0.9, duration: 2.0)
//                                                 ]))
//            }
//        else{
//            myBlueSpriteNode.removeAllActions()
//        }
//
        if let _ = spaceship.action(forKey: "Rotation"){
            spaceship.removeAction(forKey: "Rotation")
        }
        else{
            spaceship.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 2.0)), withKey: "Rotation")
        }
    }
}
