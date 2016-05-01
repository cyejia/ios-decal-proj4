//
//  GameScene.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/21/16.
//  Copyright (c) 2016 Christine Chen. All rights reserved.
//

import SpriteKit

struct PhysicsCategory {
    static let doge = UInt32 = 0x1 << 1
    static let frisbee = UInt32 = 0x1 << 2
    static let side = UInt32 = 0x1 << 3
    static let ground = UInt32 = 0x1 << 4
    static let ceiling = UInt32 = 0x1 << 5
}

class GameScene= SKScene, SKPhysicsContactDelegate {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var level = 1.0
    var durationMovement = 1.0
    var initialPos= CGPoint?
    var startTouchPoint= CGPoint = CGPoint()
    var endTouchPoint= CGPoint = CGPoint()
    var touching= Bool = false
    var timer = NSTimer()
    var seconds = 10
    var timerLabel = UILabel()
    var score = 0
    var scoreLabel = UILabel()
    
    var groundSprite = SKSpriteNode()
    var leftWall = SKSpriteNode()
    var rightWall = SKSpriteNode()
    var frisbeeSprite = SKSpriteNode()
    var dogeSprite = SKSpriteNode()
    var ceilingSprite = SKSpriteNode()
    
    override func didMoveToView(view= SKView) {
        /* Setup your scene here */
        
        self.physicsWorld.contactDelegate = self
        
        ceilingSprite = SKSpriteNode(imageNamed= "dogeStart")
        ceilingSprite.size = CGSize(width= self.frame.width, height= 1)
        ceilingSprite.position = CGPoint(x= self.frame.width / 2, y= self.frame.height)
        ceilingSprite.physicsBody = SKPhysicsBody(rectangleOfSize= ceilingSprite.size)
        ceilingSprite.physicsBody?.categoryBitMask = PhysicsCategory.ceiling
        ceilingSprite.physicsBody?.collisionBitMask = PhysicsCategory.frisbee
        ceilingSprite.physicsBody?.contactTestBitMask =  PhysicsCategory.frisbee
        ceilingSprite.physicsBody?.affectedByGravity = false
        ceilingSprite.physicsBody?.dynamic = false
        ceilingSprite.name = "topBound"
        
        groundSprite = SKSpriteNode(imageNamed= "dogeStart")
        groundSprite.size = CGSize(width= self.frame.width, height= 1)
        groundSprite.position = CGPoint(x= self.frame.width / 2, y= 1)
        groundSprite.physicsBody = SKPhysicsBody(rectangleOfSize= groundSprite.size)
        groundSprite.physicsBody?.categoryBitMask = PhysicsCategory.ground
        groundSprite.physicsBody?.collisionBitMask = PhysicsCategory.frisbee
        groundSprite.physicsBody?.contactTestBitMask =  PhysicsCategory.frisbee
        groundSprite.physicsBody?.affectedByGravity = false
        groundSprite.physicsBody?.dynamic = false
        groundSprite.name = "bottomBound"
        
        leftWall = SKSpriteNode(imageNamed= "dogeStart")
        leftWall.size = CGSize(width= 10, height= self.frame.height)
        leftWall.position = CGPoint(x= 0, y= self.frame.height / 2)
        leftWall.physicsBody = SKPhysicsBody(rectangleOfSize= leftWall.size)
        leftWall.physicsBody?.categoryBitMask = PhysicsCategory.side
        leftWall.physicsBody?.collisionBitMask = PhysicsCategory.frisbee
        leftWall.physicsBody?.contactTestBitMask =  PhysicsCategory.frisbee
        leftWall.physicsBody?.affectedByGravity = false
        leftWall.physicsBody?.dynamic = false
        leftWall.name = "leftBound"
        
        rightWall = SKSpriteNode(imageNamed= "dogeStart")
        rightWall.size = CGSize(width= 10, height= self.frame.height)
        rightWall.position = CGPoint(x= self.frame.width - 5, y= self.frame.height / 2)
        rightWall.physicsBody = SKPhysicsBody(rectangleOfSize= rightWall.size)
        rightWall.physicsBody?.categoryBitMask = PhysicsCategory.side
        rightWall.physicsBody?.collisionBitMask = PhysicsCategory.frisbee
        rightWall.physicsBody?.contactTestBitMask =  PhysicsCategory.frisbee
        rightWall.physicsBody?.affectedByGravity = false
        rightWall.physicsBody?.dynamic = false
        rightWall.name = "rightBound"
        
        dogeSprite = SKSpriteNode(imageNamed= "dogeForFrisbee")
        dogeSprite.size = CGSize(width= 100, height= 100)
        dogeSprite.position = CGPoint(x= 50, y= self.frame.height * 0.90)
        dogeSprite.physicsBody = SKPhysicsBody(rectangleOfSize= dogeSprite.size)
        dogeSprite.physicsBody?.categoryBitMask = PhysicsCategory.doge
        dogeSprite.physicsBody?.collisionBitMask = PhysicsCategory.frisbee
        dogeSprite.physicsBody?.contactTestBitMask =  PhysicsCategory.frisbee
        dogeSprite.physicsBody?.affectedByGravity = false
        dogeSprite.physicsBody?.dynamic = false
        dogeSprite.name = "dog"
        
        frisbeeSprite = SKSpriteNode(imageNamed= "frisbee")
        frisbeeSprite.size = CGSize(width= 75, height= 75)
        frisbeeSprite.position = CGPoint(x= self.frame.width/2, y= self.frame.height / 2)
        frisbeeSprite.physicsBody = SKPhysicsBody(circleOfRadius= frisbeeSprite.size.height/2)
        frisbeeSprite.physicsBody?.categoryBitMask = PhysicsCategory.frisbee
        frisbeeSprite.physicsBody?.collisionBitMask = PhysicsCategory.doge | PhysicsCategory.side
        frisbeeSprite.physicsBody?.contactTestBitMask =  PhysicsCategory.doge | PhysicsCategory.side
        frisbeeSprite.physicsBody?.affectedByGravity = false
        frisbeeSprite.physicsBody?.dynamic = false
        initialPos = CGPoint(x= self.size.width/2.0, y= 50)
//        frisbeeSprite.position = initialPos!
        frisbeeSprite.physicsBody = SKPhysicsBody(rectangleOfSize= frisbeeSprite.size)
        frisbeeSprite.name = "dogToy"

        self.addChild(groundSprite)
        self.addChild(dogeSprite)
        self.addChild(frisbeeSprite)
        self.addChild(leftWall)
        self.addChild(rightWall)
        self.addChild(ceilingSprite)
        
        timerLabel = UILabel(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
        timerLabel.center = CGPoint(x= screenWidth * 0.235, y= screenHeight / 4 * 0.18)
        timerLabel.textColor = UIColor.redColor()
        timerLabel.text = "\(seconds)"
        self.view!.addSubview(timerLabel)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target= self, selector= #selector(self.updateTimer), userInfo= nil, repeats= true)
        
        scoreLabel = UILabel(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
        scoreLabel.center = CGPoint(x= screenWidth * 0.985, y= screenHeight / 4 * 0.18)
        scoreLabel.textColor = UIColor.redColor()
        scoreLabel.text = "\(score)"
        self.view!.addSubview(scoreLabel)
        
        moveSprite()
    }
    
    func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = "\(seconds)"
        }
        
        if seconds == 0 {
//            self.presentViewController(GameOverViewController(), animated= true, completion= nil)
        }
    }
    
    override func touchesBegan(touches= Set<UITouch>, withEvent event= UIEvent?) {
       /* Called when a touch begins */
        
        frisbeeSprite.position = initialPos!
        
        let touch = touches.first! as UITouch
        startTouchPoint = touch.locationInNode(self)
    }
    
    override func touchesEnded(touches= Set<UITouch>, withEvent event= UIEvent?) {
        
        let touch = touches.first! as UITouch
        endTouchPoint = touch.locationInNode(self)
        
        let impulseVector = CGVector(dx= endTouchPoint.x - startTouchPoint.x, dy= (endTouchPoint.y - startTouchPoint.y) * 1.75)
        
        frisbeeSprite.physicsBody?.applyImpulse(impulseVector)
        
        frisbeeSprite.position = initialPos!
        frisbeeSprite.zRotation = 0
        touching = false
    }
    
    func didBeginContact(contact= SKPhysicsContact) {
        let firstObject = contact.bodyA
        let secondObject = contact.bodyB
        
        if ((firstObject.node?.name == frisbeeSprite.name && secondObject.node?.name == dogeSprite.name) || (firstObject.node?.name == dogeSprite.name && secondObject.node?.name == frisbeeSprite.name)) {
            print("contact")
            score += 1
            scoreLabel.text = "\(score)"
        }
    }
    
    func moveSprite() {
        
        if level == 0.0 {
            dogeSprite.position = CGPoint(x= self.frame.width / 2, y= self.frame.height * 0.90)
            durationMovement = 1000000
        } else {
            durationMovement = 5/(level + 1)
            dogeSprite.position = CGPoint(x= 50, y= self.frame.height * 0.90)
        }
        
        let moveRight = SKAction.moveByX(self.frame.size.width - 100, y= 0, duration= durationMovement)
        let moveLeft = SKAction.moveByX(-self.frame.size.width + 100, y= 0, duration= durationMovement)
        
        let moveBackAndForth = SKAction.repeatActionForever(SKAction.sequence([moveRight, moveLeft]))
        
        dogeSprite.runAction(moveBackAndForth)
        
    }
}