//
//  GameScene.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/21/16.
//  Copyright (c) 2016 Christine Chen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let sprite = SKSpriteNode(imageNamed:"frisbee")
    var touchPoint: CGPoint = CGPoint()
    var touching: Bool = false
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        sprite.size = CGSize(width: 100.0, height: 100.0)
//        sprite = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 50, height: 50))
        sprite.physicsBody = SKPhysicsBody(rectangleOfSize: sprite.size)
        sprite.position = CGPoint(x: self.size.width/2.0, y: self.size.height/2.0)
        self.addChild(sprite)
        
//        sprite.xScale = 0.5
//        sprite.yScale = 0.5
//        sprite.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
//        self.addChild(sprite)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        let touch = touches.first! as UITouch
        let location = touch.locationInNode(self)
        if sprite.frame.contains(location) {
            touchPoint = location
            touching = true
        }
        
//        for touch in (touches ) {
//            let location = touch.locationInNode(self)
//            if sprite.containsPoint(location) {
//                sprite.position = location
//            }
//        }
    }
   
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first! as UITouch
        let location = touch.locationInNode(self)
        touchPoint = location
        
//        for touch in (touches ) {
//            let location = touch.locationInNode(self)
//            if sprite.containsPoint(location) {
//                sprite.position = location
//            }
//        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        sprite.position = CGPoint(x: self.size.width/2.0, y: self.size.height*0.95)
        touching = false
    }
//    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if touching {
            
            let impulseVector = CGVector(dx: touchPoint.x - sprite.position.x, dy: touchPoint.y)
            // If myShip starts moving too fast or too slow, you can multiply impulseVector by a constant or clamp its range
            sprite.physicsBody?.applyImpulse(impulseVector)
//            var dt = CGFloat()
//            dt = 1/60.0
//            let distance = CGVector(dx: touchPoint.x-sprite.position.x, dy: touchPoint.y-sprite.position.y)
//            let velocity = CGVector(dx: distance.dx/dt, dy: distance.dy/dt)
//            sprite.physicsBody!.velocity=velocity
        }
    }
}