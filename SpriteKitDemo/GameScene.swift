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

        if let touch = touches.first{
            var angle = .pi + -1 * atan2(spaceship.position.x - (touch.location(in: myFirstSpriteNode).x), spaceship.position.y - (touch.location(in: myFirstSpriteNode).y))
               
            let spaceAngle = spaceship.zRotation
            if angle - spaceAngle > .pi { angle -= 2 * .pi }
            if angle - spaceAngle < -1 * .pi {angle -= 2 * .pi}
            
            let duration = abs(TimeInterval(Float((angle - spaceAngle / .pi) * 0.3)))
            
        spaceship.run(
            SKAction.sequence([
                SKAction.rotate(toAngle: angle, duration: duration),
                SKAction.move(to: (touch.location(in: myFirstSpriteNode)), duration: 1.0)
            ]))
         }
//        if !spaceship.hasActions(){
//        spaceship.run(
//            SKAction.repeatForever(
//            SKAction.sequence([
//            SKAction.rotate(byAngle: .pi / -4, duration: 0.125),
//            SKAction.move(to:CGPoint(x: myFirstSpriteNode.size.width,y: myFirstSpriteNode.size.height),duration: 2.0),
//            SKAction.rotate(byAngle: .pi, duration: 0.5),
//            SKAction.move(to:CGPoint.zero,duration: 2.0),
//                SKAction.rotate(byAngle: .pi * 3 / -4, duration: 0.375)
//        ])))
//        }
        
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
//        if let _ = myFirstTexturedSpriteNode.action(forKey: "Rotation"){
//            myFirstTexturedSpriteNode.removeAction(forKey: "Rotation")
//        }
//        else{
//        myFirstTexturedSpriteNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 2.0)), withKey: "Rotation")
//        }
    }
}
