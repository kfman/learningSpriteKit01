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
    let blueBox = SKSpriteNode(color:UIColor.blue, size: CGSize(width: 100.0, height: 100.0))
    let spaceship = SKSpriteNode(imageNamed: "spaceship")
    
    override func didMove(to view: SKView) {
        addChild(myFirstNode)
        
        myFirstSpriteNode.position = CGPoint(x: frame.midX - 100, y: frame.midY - 150)
        myFirstSpriteNode.anchorPoint = CGPoint.zero
        addChild(myFirstSpriteNode)
        
        spaceship.size = CGSize(width: 100.0, height: 100.0)
        spaceship.zPosition = 1
        myFirstSpriteNode.addChild(spaceship)
        blueBox.position = CGPoint(x:myFirstSpriteNode.size.width / 2 , y:myFirstSpriteNode.size.height / 2)
        blueBox.zPosition = 2
        myFirstSpriteNode.addChild(blueBox)
        
        physicsWorld.gravity = CGVector(dx: -1.0, dy: -2.0)
        spaceship.physicsBody = SKPhysicsBody(circleOfRadius: spaceship.size.width / 2)
        spaceship.physicsBody!.restitution = 1.0
        
        blueBox.physicsBody = SKPhysicsBody(rectangleOf: blueBox.size)
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
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
