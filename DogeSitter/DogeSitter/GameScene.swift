//
//  GameScene.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/21/16.
//  Copyright (c) 2016 Christine Chen. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let doge : UInt32 = 0x1 << 1
    static let frisbee : UInt32 = 0x1 << 2
    static let side : UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    let sprite = SKSpriteNode(imageNamed:"frisbee")
    var initialPos: CGPoint?
    var startTouchPoint: CGPoint = CGPoint()
    var endTouchPoint: CGPoint = CGPoint()
    var touching: Bool = false
    var ground = SKSpriteNode()
    var leftWall = SKSpriteNode()
    var rightWall = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        sprite.size = CGSize(width: 100.0, height: 100.0)
        sprite.physicsBody = SKPhysicsBody(rectangleOfSize: sprite.size)
        initialPos = CGPoint(x: self.size.width/2.0, y: 50)
        sprite.position = initialPos!
        self.addChild(sprite)
//        
//        ground = SKSpriteNode(imageNamed: "Transparent")
//        ground.size = CGSize(width: self.frame.width, height: 1)
//        ground.position = CGPoint(x: self.frame.width / 2, y: 0)
//        ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
//        ground.physicsBody?.categoryBitMask = PhysicsCategory.ground
//        ground.physicsBody?.collisionBitMask = PhysicsCategory.ball
//        ground.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
//        ground.physicsBody?.affectedByGravity = false
//        ground.physicsBody?.dynamic = false
//        
//        leftWall = SKSpriteNode(imageNamed: "Transparent")
//        leftWall.size = CGSize(width: 10, height: self.frame.height)
//        leftWall.position = CGPoint(x: 0, y: self.frame.height / 2)
//        leftWall.physicsBody = SKPhysicsBody(rectangleOfSize: leftWall.size)
//        leftWall.physicsBody?.categoryBitMask = PhysicsCategory.side
//        leftWall.physicsBody?.collisionBitMask = PhysicsCategory.ball
//        leftWall.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
//        leftWall.physicsBody?.affectedByGravity = false
//        leftWall.physicsBody?.dynamic = false
//        
//        rightWall = SKSpriteNode(imageNamed: "Transparent")
//        rightWall.size = CGSize(width: 10, height: self.frame.height)
//        rightWall.position = CGPoint(x: self.frame.width - 5, y: self.frame.height / 2)
//        rightWall.physicsBody = SKPhysicsBody(rectangleOfSize: rightWall.size)
//        rightWall.physicsBody?.categoryBitMask = PhysicsCategory.side
//        rightWall.physicsBody?.collisionBitMask = PhysicsCategory.ball
//        rightWall.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
//        rightWall.physicsBody?.affectedByGravity = false
//        rightWall.physicsBody?.dynamic = false
        
        self.addChild(ground)
        self.addChild(leftWall)
        self.addChild(rightWall)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        sprite.position = initialPos!
        
        let touch = touches.first! as UITouch
        print ("touch.x:", touch.locationInNode(self).x)
        print ("touch.y:", touch.locationInNode(self).y)
        startTouchPoint = touch.locationInNode(self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        print ("touch.x:", touch.locationInNode(self).x)
        print ("touch.y:", touch.locationInNode(self).y)
        endTouchPoint = touch.locationInNode(self)
        
        let impulseVector = CGVector(dx: endTouchPoint.x - startTouchPoint.x, dy: endTouchPoint.y - startTouchPoint.y)
        
        sprite.physicsBody?.applyImpulse(impulseVector)
        
        
        sprite.position = initialPos!
        touching = false
    }
}