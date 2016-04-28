//
//  Game1.swift
//  DogeSitter2
//
//  Created by Yejia Chen on 4/27/16.
//  Copyright © 2016 Yejia Chen. All rights reserved.
//

import Foundation
import SpriteKit


struct PhysicsCategory {
    static let doge : UInt32 = 0x1 << 1
    static let ball : UInt32 = 0x1 << 2
}

class Game1: SKScene {
    
    var dogeSprite = SKSpriteNode()
    //<a href='http://www.freepik.com/free-vector/sport-balls-vector-free_711371.htm'>Designed by Freepik</a>
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let blueColor = CIColor(red: 56/256, green: 237/256, blue: 228/256)
        
        self.backgroundColor = SKColor(CIColor: blueColor)
        dogeSprite = SKSpriteNode(imageNamed: "Doge1")
        dogeSprite.size = CGSize(width: 100, height: 100)
        dogeSprite.position = CGPoint(x: self.frame.width/2, y: 60)
        
        dogeSprite.physicsBody = SKPhysicsBody(circleOfRadius: dogeSprite.size.height/2)
        dogeSprite.physicsBody?.categoryBitMask = PhysicsCategory.doge
        dogeSprite.physicsBody?.collisionBitMask = PhysicsCategory.ball
        dogeSprite.physicsBody?.contactTestBitMask = PhysicsCategory.ball
        dogeSprite.physicsBody?.affectedByGravity = false
        dogeSprite.physicsBody?.dynamic = false
        
        self.addChild(dogeSprite)
        
        loadBalls()
    }
    
    func loadBalls() {
        let numBalls : Int? = userDefaults.objectForKey("currentLevel") as? Int
        
        for _ in 1...(numBalls!) {
            let ballSprite = SKSpriteNode(imageNamed: "Ball")
            ballSprite.size = CGSize(width: 50, height: 50)
            let xPosition = (arc4random_uniform(UInt32(self.frame.width*0.75))) + UInt32(self.frame.width * 0.125)
            ballSprite.position = CGPoint(x: CGFloat(xPosition), y: self.frame.height)
            
            ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: ballSprite.size.height/2)
            ballSprite.physicsBody?.categoryBitMask = PhysicsCategory.ball
            ballSprite.physicsBody?.collisionBitMask = PhysicsCategory.doge
            ballSprite.physicsBody?.contactTestBitMask = PhysicsCategory.doge
            
            self.addChild(ballSprite)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
