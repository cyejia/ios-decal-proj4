//
//  Game1.swift
//  DogeSitter2
//
//  Created by Yejia Chen on 4/27/16.
//  Copyright © 2016 Yejia Chen. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion



struct PhysicsCategory {
    static let doge : UInt32 = 0x1 << 1
    static let ball : UInt32 = 0x1 << 2
    static let ground : UInt32 = 0x1 << 3
    static let side : UInt32 = 0x1 << 4
}

class Game1: SKScene, SKPhysicsContactDelegate {
    
    // ALL GAMES
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var curGame = Int()

    var gameTimer = NSTimer()
    var timerLabel = UILabel()
    var seconds = Int()
    
    var ground = SKSpriteNode()
    var leftWall = SKSpriteNode()
    var rightWall = SKSpriteNode()
    
    var gameOver = Bool()
    var scoreTable = SKSpriteNode()
    var restartButton = SKSpriteNode()
    
    // -----------------
    
    // BOUNCE GAME
    var dogeSpriteForBounceGame = SKSpriteNode()
    var motionManager = CMMotionManager()
    var destX : CGFloat = 0.0
    var ballTimer = NSTimer()
    var numBalls = 0
    
    // -----------------

    // FRISBEE GAME
    
    // -----------------

    // CAT GAME

    
    override func didMoveToView(view: SKView) {
        newGame()

    }
    
    func newGame() {
        self.removeAllActions()
        self.removeAllChildren()
//        userDefaults.setValue(Int(0), forKey: "currentLevel")
        createUniversalScene()
    }
    
    func createUniversalScene() {
        gameOver = false
        numBalls = userDefaults.objectForKey("currentLevel") as! Int
        
        let blueColor = CIColor(red: 56/256, green: 237/256, blue: 228/256)
        
        self.backgroundColor = SKColor(CIColor: blueColor)
        seconds = 10
        timerLabel = UILabel(frame: CGRect(x: self.frame.width / 2 - 25, y: 0, width: 50, height: 50))
        timerLabel.textColor = SKColor.magentaColor()
        timerLabel.textAlignment = NSTextAlignment.Center
        timerLabel.font = UIFont(name: "Arial Rounded MT Bold", size: 30)
        timerLabel.text = "\(seconds)"
        self.view!.addSubview(timerLabel)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -8.0)
        
        ground = SKSpriteNode(imageNamed: "Transparent")
        ground.size = CGSize(width: self.frame.width, height: 1)
        ground.position = CGPoint(x: self.frame.width / 2, y: 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
        ground.physicsBody?.categoryBitMask = PhysicsCategory.ground
        ground.physicsBody?.collisionBitMask = PhysicsCategory.ball
        ground.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.dynamic = false
        
        leftWall = SKSpriteNode(imageNamed: "Transparent")
        leftWall.size = CGSize(width: 10, height: self.frame.height)
        leftWall.position = CGPoint(x: 0, y: self.frame.height / 2)
        leftWall.physicsBody = SKPhysicsBody(rectangleOfSize: leftWall.size)
        leftWall.physicsBody?.categoryBitMask = PhysicsCategory.side
        leftWall.physicsBody?.collisionBitMask = PhysicsCategory.ball
        leftWall.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
        leftWall.physicsBody?.affectedByGravity = false
        leftWall.physicsBody?.dynamic = false
        
        rightWall = SKSpriteNode(imageNamed: "Transparent")
        rightWall.size = CGSize(width: 10, height: self.frame.height)
        rightWall.position = CGPoint(x: self.frame.width - 5, y: self.frame.height / 2)
        rightWall.physicsBody = SKPhysicsBody(rectangleOfSize: rightWall.size)
        rightWall.physicsBody?.categoryBitMask = PhysicsCategory.side
        rightWall.physicsBody?.collisionBitMask = PhysicsCategory.ball
        rightWall.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
        rightWall.physicsBody?.affectedByGravity = false
        rightWall.physicsBody?.dynamic = false
        
        self.addChild(ground)
        self.addChild(leftWall)
        self.addChild(rightWall)
        
        startBounceGame()
        
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = "\(seconds)"
        }
        
        if seconds == 0 {
            // start next game
            print("Level completed!")
        }
    }
    
    func createScoreTable() {
        scoreTable = SKSpriteNode(color: SKColor.greenColor(), size: CGSize(width: 200, height: 100))
        scoreTable.position = CGPoint(x: self.frame.width/2 - 200, y: self.frame.height / 2 - 50)
        scoreTable.zPosition = 5
        restartButton = SKSpriteNode(color: SKColor.cyanColor(), size: CGSize(width: 100, height: 20))
        restartButton.position = CGPoint(x: self.frame.width/2 - 50, y: self.frame.height / 2 - 50)
        restartButton.zPosition = 6
        
        self.addChild(scoreTable)
        self.addChild(restartButton)
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        let action = SKAction.moveToX(destX, duration: 0.5)
        self.dogeSpriteForBounceGame.runAction(action)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let firstObject = contact.bodyA
        let secondObject = contact.bodyB
        
        if ((firstObject.categoryBitMask == PhysicsCategory.ground && secondObject.categoryBitMask == PhysicsCategory.ball) ||
            (firstObject.categoryBitMask == PhysicsCategory.ball && secondObject.categoryBitMask == PhysicsCategory.ground)) {
            print("Game over")
            gameOver = true
        } else if ((firstObject.categoryBitMask == PhysicsCategory.doge && secondObject.categoryBitMask == PhysicsCategory.ball) ||
                   (firstObject.categoryBitMask == PhysicsCategory.ball && secondObject.categoryBitMask == PhysicsCategory.doge)) {
            if (firstObject.categoryBitMask == PhysicsCategory.ball) {
                firstObject.applyImpulse(CGVectorMake(0, 70))
            } else {
                secondObject.applyImpulse(CGVectorMake(0, 70))
            }
        }
    }
    
    // Ball image from http://www.freepik.com/free-vector/sport-balls-vector-free_711371.htm'
    
    
    // BOUNCE GAME
    
    func startBounceGame() {
        dogeSpriteForBounceGame = SKSpriteNode(imageNamed: "Doge1")
        dogeSpriteForBounceGame.size = CGSize(width: 100, height: 100)
        dogeSpriteForBounceGame.position = CGPoint(x: self.frame.width/2, y: 60)
        
        dogeSpriteForBounceGame.physicsBody = SKPhysicsBody(circleOfRadius: dogeSpriteForBounceGame.size.height/2)
        dogeSpriteForBounceGame.physicsBody?.categoryBitMask = PhysicsCategory.doge
        dogeSpriteForBounceGame.physicsBody?.collisionBitMask = PhysicsCategory.ball
        dogeSpriteForBounceGame.physicsBody?.contactTestBitMask =  PhysicsCategory.ball
        dogeSpriteForBounceGame.physicsBody?.affectedByGravity = false
        dogeSpriteForBounceGame.physicsBody?.dynamic = false
        
        self.addChild(dogeSpriteForBounceGame)
        
        self.destX = self.dogeSpriteForBounceGame.position.x
        
        if motionManager.accelerometerAvailable == true {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:{
                data, error in
                
                let currentX = self.dogeSpriteForBounceGame.position.x
                
                let newX = currentX + CGFloat(data!.acceleration.x * 100)
                
                if (newX > 0 && newX < self.frame.width) {
                    self.destX = newX
                }
                
            })
            
        }
        
        startBallTimer()
    }
    
    func loadBalls(timer:NSTimer) {
        numBalls -= 1
        if (numBalls >= 0) {
            let ballSprite = SKSpriteNode(imageNamed: "Ball")
            ballSprite.size = CGSize(width: 50, height: 50)
            let xPosition = (arc4random_uniform(UInt32(self.frame.width - 150))) + UInt32(70)
            ballSprite.position = CGPoint(x: CGFloat(xPosition), y: self.frame.height)
            
            ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: ballSprite.size.height/2)
            ballSprite.physicsBody?.categoryBitMask = PhysicsCategory.ball
            ballSprite.physicsBody?.collisionBitMask = PhysicsCategory.doge | PhysicsCategory.side | PhysicsCategory.ground
            ballSprite.physicsBody?.contactTestBitMask = PhysicsCategory.doge | PhysicsCategory.side | PhysicsCategory.ground
            
            self.addChild(ballSprite)
            
            self.startBallTimer()
        }
    }
    
    func startBallTimer() {
        ballTimer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                           target: self,
                                                           selector: #selector(loadBalls),
                                                           userInfo: nil,
                                                           repeats: false)
    }
    

}
