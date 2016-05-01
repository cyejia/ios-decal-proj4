//
//  GameScene.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/21/16.
//  Copyright (c) 2016 Christine Chen. All rights reserved.
//

import Foundation
import SpriteKit
import CoreMotion

struct PhysicsCategory {
    static let doge : UInt32 = 0x1 << 1
    static let toy : UInt32 = 0x1 << 2
    static let side : UInt32 = 0x1 << 3
    static let ground : UInt32 = 0x1 << 4
    static let ceiling : UInt32 = 0x1 << 5
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // ----------------
    // ALL GAME VARIABLES
    // ----------------
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    var curGame = Int()
    var curLevel = Int()
    
    var gameTimer = NSTimer()
    var seconds = Int()
    var timerLabel = SKLabelNode()
    
    var gameOver = Bool()
    var scoreTable = SKSpriteNode()
    var highScoreLabel = SKLabelNode()
    var lastScoreLabel = SKLabelNode()
    var restartButton = SKSpriteNode()
    var restartButtonLabel = SKLabelNode()
    
    var ground = SKSpriteNode()
    var leftWall = SKSpriteNode()
    var rightWall = SKSpriteNode()
    
    // ----------------
    // BOUNCE GAME
    // ----------------
    
    var dogeSpriteForBounceGame = SKSpriteNode()
    var motionManager = CMMotionManager()
    var ballTimer = NSTimer()
    var numBalls = Int()
    
    // ----------------
    // FRISBEE GAME
    // ----------------

    
    var durationMovement = 1.0
    var initialPos: CGPoint?
    var startTouchPoint: CGPoint = CGPoint()
    var endTouchPoint: CGPoint = CGPoint()
    var touching: Bool = false
    var score = 0
    var scoreLabel = SKLabelNode()
    var desiredScore = 0
    var desiredScoreLabel = SKLabelNode()
    
    var frisbeeSprite = SKSpriteNode()
    var dogeSpriteForFrisbeeGame = SKSpriteNode()
    var ceilingSprite = SKSpriteNode()
    
    // ----------------
    // CAT GAME
    // ----------------

    var GrumpyButton1: SKSpriteNode!
    var GrumpyButton2: SKSpriteNode!
    var GrumpyButton3: SKSpriteNode!
    var GrumpyButton4: SKSpriteNode!
    var GrumpyButton5: SKSpriteNode!
    var GrumpyButton6: SKSpriteNode!
    var GrumpyButton7: SKSpriteNode!
    var GrumpyButton8: SKSpriteNode!
    var GrumpyButton9: SKSpriteNode!
    var GrumpyButton10: SKSpriteNode!
    var GrumpyButton11: SKSpriteNode!
    var GrumpyButton12: SKSpriteNode!
    var GrumpyButton13: SKSpriteNode!
    var GrumpyButton14: SKSpriteNode!
    var GrumpyButton15: SKSpriteNode!
    
    var DogeButton1: SKSpriteNode!
    var DogeButton2: SKSpriteNode!
    var DogeButton3: SKSpriteNode!
    var DogeButton4: SKSpriteNode!
    var DogeButton5: SKSpriteNode!

    var buttonWidth = CGFloat()
    var buttonHeight = CGFloat()
    
    var catScore = 0
    var catScoreLabel = SKLabelNode()
    var catDesiredScore = 10
    var catDesiredScoreLabel = SKLabelNode()
    
    
    
    
    // ----------------
    // ALL GAME FUNCTIONS
    // ----------------
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        curLevel = 0
        newGame()
        motionManager.startDeviceMotionUpdates()
    }
    
    func newGame() {
        gameOver = false
        self.removeAllActions()
        self.removeAllChildren()
        ballTimer.invalidate()
        gameTimer.invalidate()
        createUniversalScene()
    }
    
    func createUniversalScene() {

        let blueColor = CIColor(red: 56/256, green: 237/256, blue: 228/256)
        self.backgroundColor = SKColor(CIColor: blueColor)
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -9.8)

        seconds = 10
        timerLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        timerLabel.fontColor = UIColor.magentaColor()
        timerLabel.text = "\(seconds)"
        timerLabel.position = CGPoint(x: 30, y: self.frame.height - 50)
        timerLabel.zPosition = 4
        self.addChild(timerLabel)
        
        ground = SKSpriteNode(imageNamed: "Transparent")
        ground.size = CGSize(width: self.frame.width, height: 1)
        ground.position = CGPoint(x: self.frame.width / 2, y: 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
        ground.physicsBody?.categoryBitMask = PhysicsCategory.ground
        ground.physicsBody?.collisionBitMask = PhysicsCategory.toy | PhysicsCategory.doge
        ground.physicsBody?.contactTestBitMask =  PhysicsCategory.toy | PhysicsCategory.doge
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.dynamic = false
        ground.name = "bottomBound"

        
        leftWall = SKSpriteNode(imageNamed: "Transparent")
        leftWall.size = CGSize(width: 10, height: self.frame.height)
        leftWall.position = CGPoint(x: 0, y: self.frame.height / 2)
        leftWall.physicsBody = SKPhysicsBody(rectangleOfSize: leftWall.size)
        leftWall.physicsBody?.categoryBitMask = PhysicsCategory.side
        leftWall.physicsBody?.collisionBitMask = PhysicsCategory.toy | PhysicsCategory.doge
        leftWall.physicsBody?.contactTestBitMask =  PhysicsCategory.toy | PhysicsCategory.doge
        leftWall.physicsBody?.affectedByGravity = false
        leftWall.physicsBody?.dynamic = false
        leftWall.name = "leftBound"

        
        rightWall = SKSpriteNode(imageNamed: "Transparent")
        rightWall.size = CGSize(width: 10, height: self.frame.height)
        rightWall.position = CGPoint(x: self.frame.width - 5, y: self.frame.height / 2)
        rightWall.physicsBody = SKPhysicsBody(rectangleOfSize: rightWall.size)
        rightWall.physicsBody?.categoryBitMask = PhysicsCategory.side
        rightWall.physicsBody?.collisionBitMask = PhysicsCategory.toy | PhysicsCategory.doge
        rightWall.physicsBody?.contactTestBitMask =  PhysicsCategory.toy | PhysicsCategory.doge
        rightWall.physicsBody?.affectedByGravity = false
        rightWall.physicsBody?.dynamic = false
        rightWall.name = "rightBound"
        
        self.addChild(ground)
        self.addChild(leftWall)
        self.addChild(rightWall)
        
        randomGame()
        
        gameTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func randomGame() {
        curLevel += 1
        let randomGameID = arc4random_uniform(3)
        switch randomGameID {
        case 0:
            curGame = 0
            startBounceGame()
        case 1:
            curGame = 1
            startFrisbeeGame()
        case 2:
            curGame = 2
            startCatGame()
        default:
            startFrisbeeGame()
        }
    }
    
    
    func updateTimer() {
        if seconds > 0 {
            seconds -= 1
            timerLabel.text = "\(seconds)"
            if (catScore == catDesiredScore) {
                catScore = 0
                newGame()
            }
            if ((curGame == 1) && (score == desiredScore)) {
                newGame()
            }
        }
        
        if seconds == 0 {
            if (curGame == 0) {
                newGame()
            } else if (curGame == 1) {
                if (score < desiredScore) {
                    gameOver = true
                     createScoreTable()
                } else {
                    newGame()
                }
            } else if (curGame == 2) {
                if (catScore < catDesiredScore) {
                    gameOver = true
                    createScoreTable()
                } else {
                    newGame()
                }
            }
        }
    }
    
    func createScoreTable() {
        if ((curLevel - 1) > (userDefaults.valueForKey("highScore") as! Int)) {
            userDefaults.setValue(Int(curLevel), forKey: "highScore")
        }
        
        scoreTable = SKSpriteNode(color: SKColor.whiteColor(), size: CGSize(width: self.frame.width - 50, height: 300))
        scoreTable.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        scoreTable.zPosition = 5
        
        highScoreLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        highScoreLabel.text = "High Score: \(userDefaults.valueForKey("highScore") as! Int)"
        highScoreLabel.fontColor = UIColor.magentaColor()
        highScoreLabel.fontSize = 36
        highScoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + 70)
        highScoreLabel.zPosition = 6
        
        lastScoreLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        lastScoreLabel.text = "Your Score: \(curLevel - 1)"
        lastScoreLabel.fontColor = UIColor.magentaColor()
        lastScoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        lastScoreLabel.zPosition = 6
        
        restartButton = SKSpriteNode(color: SKColor.grayColor(), size: CGSize(width: self.frame.width - 50, height: 100))
        restartButton.position = CGPoint(x: self.frame.width/2, y: self.frame.height / 2 - 100)
        restartButton.zPosition = 6
        
        restartButtonLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        restartButtonLabel.text = "Play Again"
        restartButtonLabel.fontColor = UIColor.magentaColor()
        restartButtonLabel.fontSize = 40
        restartButtonLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 - 115)
        restartButtonLabel.zPosition = 7

        
        self.addChild(scoreTable)
        self.addChild(highScoreLabel)
        self.addChild(lastScoreLabel)
        self.addChild(restartButton)
        self.addChild(restartButtonLabel)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if (curGame == 0) {
            updateDogeForBounceGame()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        let touch = touches.first! as UITouch
        if (!gameOver) {
            if (curGame == 1) {
                frisbeeSprite.position = initialPos!
                startTouchPoint = touch.locationInNode(self)
                
            }
            
            if (curGame == 2) {
                if touch.locationInNode(self).y > buttonHeight {
                    gameTimer.invalidate()
                    gameOver = true
                    createScoreTable()
                }
                
                let positionInScene = touch.locationInNode(self)
                let touchedNode = self.nodeAtPoint(positionInScene)
                
                if let name = touchedNode.name {
                    if ((name == "Grumpy1") || (name == "Grumpy2") || (name == "Grumpy3") || (name == "Grumpy4") || (name == "Grumpy5") || (name == "Grumpy6") || (name == "Grumpy7") || (name == "Grumpy8") || (name == "Grumpy9") || (name == "Grumpy10") || (name == "Grumpy11") || (name == "Grumpy12") || (name == "Grumpy13") || (name == "Grumpy14") || (name == "Grumpy15")) {
                        gameTimer.invalidate()
                        gameOver = true
                        createScoreTable()
                    }
                }
                
                catScore += 1
                catScoreLabel.text = "\(catScore)"
                
                GrumpyButton1.position.y = GrumpyButton1.position.y - buttonHeight
                GrumpyButton2.position.y = GrumpyButton2.position.y - buttonHeight
                GrumpyButton3.position.y = GrumpyButton3.position.y - buttonHeight
                GrumpyButton4.position.y = GrumpyButton4.position.y - buttonHeight
                GrumpyButton5.position.y = GrumpyButton5.position.y - buttonHeight
                GrumpyButton6.position.y = GrumpyButton6.position.y - buttonHeight
                GrumpyButton7.position.y = GrumpyButton7.position.y - buttonHeight
                GrumpyButton8.position.y = GrumpyButton8.position.y - buttonHeight
                GrumpyButton9.position.y = GrumpyButton9.position.y - buttonHeight
                GrumpyButton10.position.y = GrumpyButton10.position.y - buttonHeight
                GrumpyButton11.position.y = GrumpyButton11.position.y - buttonHeight
                GrumpyButton12.position.y = GrumpyButton12.position.y - buttonHeight
                GrumpyButton13.position.y = GrumpyButton13.position.y - buttonHeight
                GrumpyButton14.position.y = GrumpyButton14.position.y - buttonHeight
                GrumpyButton15.position.y = GrumpyButton15.position.y - buttonHeight
                
                DogeButton1.position.y = DogeButton1.position.y - buttonHeight
                DogeButton2.position.y = DogeButton2.position.y - buttonHeight
                DogeButton3.position.y = DogeButton3.position.y - buttonHeight
                DogeButton4.position.y = DogeButton4.position.y - buttonHeight
                DogeButton5.position.y = DogeButton5.position.y - buttonHeight
                
                if DogeButton1.position.y == -buttonHeight / 2.0 {
                    DogeButton1.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton1.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton6.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton11.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    randomPlacement1()
                }
                if DogeButton2.position.y == -buttonHeight / 2.0 {
                    DogeButton2.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton2.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton7.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton12.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    randomPlacement2()
                }
                if DogeButton3.position.y == -buttonHeight / 2.0 {
                    DogeButton3.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton3.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton8.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton13.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    randomPlacement3()
                }
                if DogeButton4.position.y == -buttonHeight / 2.0 {
                    DogeButton4.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton4.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton9.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton14.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    randomPlacement5()
                }
                
                if DogeButton5.position.y == -buttonHeight / 2.0 {
                    DogeButton5.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton5.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton10.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    GrumpyButton15.position.y = buttonHeight * 4 + (buttonHeight / 2.0)
                    randomPlacement5()
                }
            }
        }
        
        
        
        for touch in touches {
            let location = touch.locationInNode(self)
            if (gameOver) {
                if (restartButton.containsPoint(location)) {
                    curLevel = 0
                    newGame()
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (!gameOver) {
            if (curGame == 1) {
                let touch = touches.first! as UITouch
                endTouchPoint = touch.locationInNode(self)
                
                let impulseVector = CGVector(dx: endTouchPoint.x - startTouchPoint.x, dy: (endTouchPoint.y - startTouchPoint.y) * 1.75)
                
                frisbeeSprite.physicsBody?.applyImpulse(impulseVector)
                
                frisbeeSprite.position = initialPos!
                frisbeeSprite.zRotation = 0
                touching = false
            }
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        let firstObject = contact.bodyA
        let secondObject = contact.bodyB
        
        if (!gameOver) {
            if (curGame == 0) {
                if ((firstObject.categoryBitMask == PhysicsCategory.ground && secondObject.categoryBitMask == PhysicsCategory.toy) ||
                    (firstObject.categoryBitMask == PhysicsCategory.toy && secondObject.categoryBitMask == PhysicsCategory.ground)) {
                    ballTimer.invalidate()
                    gameTimer.invalidate()
                    gameOver = true
                    createScoreTable()
                } else if ((firstObject.categoryBitMask == PhysicsCategory.doge && secondObject.categoryBitMask == PhysicsCategory.toy) ||
                    (firstObject.categoryBitMask == PhysicsCategory.toy && secondObject.categoryBitMask == PhysicsCategory.doge)) {
                    if (firstObject.categoryBitMask == PhysicsCategory.toy) {
                        firstObject.applyImpulse(CGVectorMake(0, 60))
                    } else {
                        secondObject.applyImpulse(CGVectorMake(0, 60))
                    }
                }
            } else if (curGame == 1) {
                if ((firstObject.node?.name == frisbeeSprite.name && secondObject.node?.name == dogeSpriteForFrisbeeGame.name) || (firstObject.node?.name == dogeSpriteForFrisbeeGame.name && secondObject.node?.name == frisbeeSprite.name)) {
                    score += 1
                    scoreLabel.text = "\(score)"
                }
            }
        }
    }
    
    // ----------------
    // BOUNCE GAME
    // ----------------
    
    func startBounceGame() {
        self.physicsWorld.gravity = CGVectorMake(0, -4.0)
        
        dogeSpriteForBounceGame = SKSpriteNode(imageNamed: "Doge1")
        dogeSpriteForBounceGame.size = CGSize(width: 100, height: 100)
        dogeSpriteForBounceGame.position = CGPoint(x: self.frame.width/2, y: 60)
        
        dogeSpriteForBounceGame.physicsBody = SKPhysicsBody(circleOfRadius: dogeSpriteForBounceGame.size.height/2)
        dogeSpriteForBounceGame.physicsBody?.categoryBitMask = PhysicsCategory.doge
        dogeSpriteForBounceGame.physicsBody?.collisionBitMask = PhysicsCategory.toy | PhysicsCategory.side | PhysicsCategory.ground
        dogeSpriteForBounceGame.physicsBody?.contactTestBitMask =  PhysicsCategory.toy | PhysicsCategory.side | PhysicsCategory.ground
        dogeSpriteForBounceGame.physicsBody?.affectedByGravity = false
        dogeSpriteForBounceGame.physicsBody?.dynamic = true
        
        self.addChild(dogeSpriteForBounceGame)
        
        numBalls = curLevel
        
        startBallTimer()
    }
    
    func updateDogeForBounceGame() {
        if (!gameOver) {
            if let roll = motionManager.deviceMotion?.attitude.roll {
                dogeSpriteForBounceGame.physicsBody?.velocity = CGVectorMake(CGFloat(roll) * 500, 0)
            }
            dogeSpriteForBounceGame.position.y = 60
            dogeSpriteForBounceGame.zRotation = 0
        }
    }
    
    func loadBalls(timer:NSTimer) {
        numBalls -= 1
        if (numBalls >= 0) {
            let ballSprite = SKSpriteNode(imageNamed: "Ball")
            ballSprite.size = CGSize(width: 50, height: 50)
            let xPosition = (arc4random_uniform(UInt32(self.frame.width - 150))) + UInt32(70)
            ballSprite.position = CGPoint(x: CGFloat(xPosition), y: self.frame.height)
            
            ballSprite.physicsBody = SKPhysicsBody(circleOfRadius: ballSprite.size.height/2)
            ballSprite.physicsBody?.categoryBitMask = PhysicsCategory.toy
            ballSprite.physicsBody?.collisionBitMask = PhysicsCategory.doge | PhysicsCategory.side | PhysicsCategory.ground | PhysicsCategory.toy
            ballSprite.physicsBody?.contactTestBitMask = PhysicsCategory.doge | PhysicsCategory.side | PhysicsCategory.ground | PhysicsCategory.toy
            
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
    
    
    // FRISBEE GAME
    
    
    func startFrisbeeGame() {
        self.physicsWorld.contactDelegate = self
        
        ceilingSprite = SKSpriteNode(imageNamed: "Transparent")
        ceilingSprite.size = CGSize(width: self.frame.width, height: 1)
        ceilingSprite.position = CGPoint(x: self.frame.width / 2, y: self.frame.height)
        ceilingSprite.physicsBody = SKPhysicsBody(rectangleOfSize: ceilingSprite.size)
        ceilingSprite.physicsBody?.categoryBitMask = PhysicsCategory.ceiling
        ceilingSprite.physicsBody?.collisionBitMask = PhysicsCategory.toy
        ceilingSprite.physicsBody?.contactTestBitMask =  PhysicsCategory.toy
        ceilingSprite.physicsBody?.affectedByGravity = false
        ceilingSprite.physicsBody?.dynamic = false
        ceilingSprite.name = "topBound"
        
        dogeSpriteForFrisbeeGame = SKSpriteNode(imageNamed: "dogeForFrisbee")
        dogeSpriteForFrisbeeGame.size = CGSize(width: 100, height: 100)
        dogeSpriteForFrisbeeGame.position = CGPoint(x: 50, y: self.frame.height * 0.90)
        dogeSpriteForFrisbeeGame.physicsBody = SKPhysicsBody(rectangleOfSize: dogeSpriteForFrisbeeGame.size)
        dogeSpriteForFrisbeeGame.physicsBody?.categoryBitMask = PhysicsCategory.doge
        dogeSpriteForFrisbeeGame.physicsBody?.collisionBitMask = PhysicsCategory.toy
        dogeSpriteForFrisbeeGame.physicsBody?.contactTestBitMask =  PhysicsCategory.toy
        dogeSpriteForFrisbeeGame.physicsBody?.affectedByGravity = false
        dogeSpriteForFrisbeeGame.physicsBody?.dynamic = false
        dogeSpriteForFrisbeeGame.name = "dog"
        
        frisbeeSprite = SKSpriteNode(imageNamed: "frisbee")
        frisbeeSprite.size = CGSize(width: 75, height: 75)
        frisbeeSprite.position = CGPoint(x: self.frame.width/2, y: self.frame.height / 2)
        frisbeeSprite.physicsBody = SKPhysicsBody(circleOfRadius: frisbeeSprite.size.height/2)
        frisbeeSprite.physicsBody?.categoryBitMask = PhysicsCategory.toy
        frisbeeSprite.physicsBody?.collisionBitMask = PhysicsCategory.doge | PhysicsCategory.side
        frisbeeSprite.physicsBody?.contactTestBitMask =  PhysicsCategory.doge | PhysicsCategory.side
        frisbeeSprite.physicsBody?.affectedByGravity = false
        frisbeeSprite.physicsBody?.dynamic = false
        initialPos = CGPoint(x: self.size.width/2.0, y: 50)
        frisbeeSprite.physicsBody = SKPhysicsBody(rectangleOfSize: frisbeeSprite.size)
        frisbeeSprite.name = "dogToy"
        
        self.addChild(dogeSpriteForFrisbeeGame)
        self.addChild(frisbeeSprite)
        self.addChild(ceilingSprite)
        
        score = 0
        
        scoreLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        scoreLabel.fontColor = UIColor.magentaColor()
        scoreLabel.text = "\(score)"
        scoreLabel.position = CGPoint(x: self.frame.width - 30, y: self.frame.height - 50)
        scoreLabel.zPosition = 4
        self.addChild(scoreLabel)
        
        desiredScore = min(curLevel * 2, 10)
        
        desiredScoreLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        desiredScoreLabel.fontColor = UIColor.magentaColor()
        desiredScoreLabel.text = "Need: \(desiredScore)"
        desiredScoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - 50)
        desiredScoreLabel.zPosition = 4

        self.addChild(desiredScoreLabel)
        
        moveSprite()
    }
    
    func moveSprite() {
        let level = curLevel
        
        if level == 1 {
            dogeSpriteForFrisbeeGame.position = CGPoint(x: self.frame.width / 2, y: self.frame.height * 0.90)
            durationMovement = 1000000
        } else {
            durationMovement = 5.0/Double(level + 1)
            dogeSpriteForFrisbeeGame.position = CGPoint(x: 50, y: self.frame.height * 0.90)
        }
        
        let moveRight = SKAction.moveByX(self.frame.size.width - 100, y: 0, duration: durationMovement)
        let moveLeft = SKAction.moveByX(-self.frame.size.width + 100, y: 0, duration: durationMovement)
        
        let moveBackAndForth = SKAction.repeatActionForever(SKAction.sequence([moveRight, moveLeft]))
        
        dogeSpriteForFrisbeeGame.runAction(moveBackAndForth)
        
    }
    
    
    // CAT GAME
    
    func startCatGame() {
        self.view?.backgroundColor = UIColor.whiteColor()
        buttonWidth = self.frame.width / 4
        buttonHeight = self.frame.height / 4
        
        catScore = 0
        catDesiredScore = curLevel + 10
        
        catScoreLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        catScoreLabel.fontColor = UIColor.magentaColor()
        catScoreLabel.text = "\(score)"
        catScoreLabel.position = CGPoint(x: self.frame.width - 30, y: self.frame.height - 50)
        catScoreLabel.zPosition = 4
        self.addChild(catScoreLabel)
        
        catDesiredScoreLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
        catDesiredScoreLabel.fontColor = UIColor.magentaColor()
        catDesiredScoreLabel.text = "Need: \(catDesiredScore)"
        catDesiredScoreLabel.position = CGPoint(x: self.frame.width / 2, y: self.frame.height - 50)
        catDesiredScoreLabel.zPosition = 4
        self.addChild(catDesiredScoreLabel)

        GrumpyButton1 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton1.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton1.position = CGPoint(x: buttonWidth / 2.0, y: (buttonHeight * 4.0) + (buttonHeight / 2.0))
        GrumpyButton1.name = "Grumpy1"
        self.addChild(GrumpyButton1)
        
        GrumpyButton2 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton2.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton2.position = CGPoint(x: buttonWidth / 2.0, y: (buttonHeight * 3.0) + (buttonHeight / 2.0))
        GrumpyButton2.name = "Grumpy2"
        self.addChild(GrumpyButton2)
        
        GrumpyButton3 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton3.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton3.position = CGPoint(x: buttonWidth / 2.0, y: (buttonHeight * 2.0) + (buttonHeight / 2.0))
        GrumpyButton3.name = "Grumpy3"
        self.addChild(GrumpyButton3)
        
        GrumpyButton4 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton4.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton4.position = CGPoint(x: buttonWidth / 2.0, y: buttonHeight + buttonHeight / 2.0)
        GrumpyButton4.name = "Grumpy4"
        self.addChild(GrumpyButton4)
        
        GrumpyButton5 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton5.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton5.position = CGPoint(x: buttonWidth / 2.0, y: buttonHeight / 2.0)
        GrumpyButton5.name = "Grumpy5"
        self.addChild(GrumpyButton5)
        
        GrumpyButton6 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton6.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton6.position = CGPoint(x: (buttonWidth * 2.0) + (buttonWidth / 2.0), y: (buttonHeight * 4.0) + (buttonHeight / 2.0))
        GrumpyButton6.name = "Grumpy6"
        self.addChild(GrumpyButton6)
        
        GrumpyButton7 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton7.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton7.position = CGPoint(x: (buttonWidth * 2.0) + (buttonWidth / 2.0), y: (buttonHeight * 3.0) + (buttonHeight / 2.0))
        GrumpyButton7.name = "Grumpy7"
        self.addChild(GrumpyButton7)
        
        GrumpyButton8 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton8.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton8.position = CGPoint(x: (buttonWidth * 2.0) + (buttonWidth / 2.0), y: (buttonHeight * 2.0) + (buttonHeight / 2.0))
        GrumpyButton8.name = "Grumpy8"
        self.addChild(GrumpyButton8)
        
        GrumpyButton9 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton9.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton9.position = CGPoint(x: (buttonWidth * 2.0) + (buttonWidth / 2.0), y: buttonHeight + buttonHeight / 2.0)
        GrumpyButton9.name = "Grumpy9"
        self.addChild(GrumpyButton9)
        
        GrumpyButton10 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton10.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton10.position = CGPoint(x: (buttonWidth * 2.0) + (buttonWidth / 2.0), y: buttonHeight / 2.0)
        GrumpyButton10.name = "Grumpy10"
        self.addChild(GrumpyButton10)
        
        GrumpyButton11 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton11.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton11.position = CGPoint(x: (buttonWidth * 3.0) + (buttonWidth / 2.0), y: (buttonHeight * 4.0) + (buttonHeight / 2.0))
        GrumpyButton11.name = "Grumpy11"
        self.addChild(GrumpyButton11)
        
        GrumpyButton12 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton12.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton12.position = CGPoint(x: (buttonWidth * 3.0) + (buttonWidth / 2.0), y: (buttonHeight * 3.0) + (buttonHeight / 2.0))
        GrumpyButton12.name = "Grumpy12"
        self.addChild(GrumpyButton12)
        
        GrumpyButton13 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton13.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton13.position = CGPoint(x: (buttonWidth * 3.0) + (buttonWidth / 2.0), y: (buttonHeight * 2.0) + (buttonHeight / 2.0))
        GrumpyButton13.name = "Grumpy13"
        self.addChild(GrumpyButton13)
        
        GrumpyButton14 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton14.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton14.position = CGPoint(x: (buttonWidth * 3.0) + (buttonWidth / 2.0), y: buttonHeight + buttonHeight / 2.0)
        GrumpyButton14.name = "Grumpy14"
        self.addChild(GrumpyButton14)
        
        GrumpyButton15 = SKSpriteNode(imageNamed: "GrumpyCat")
        GrumpyButton15.size = CGSize(width: buttonWidth, height: buttonHeight)
        GrumpyButton15.position = CGPoint(x: (buttonWidth * 3.0) + (buttonWidth / 2.0), y: buttonHeight / 2.0)
        GrumpyButton15.name = "Grumpy15"
        self.addChild(GrumpyButton15)
        
        DogeButton1 = SKSpriteNode(imageNamed: "Doge")
        DogeButton1.size = CGSize(width: buttonWidth, height: buttonHeight)
        DogeButton1.position = CGPoint(x: buttonWidth + (buttonWidth / 2.0), y: (buttonHeight * 4.0) + (buttonHeight / 2.0))
        DogeButton1.name = "Doge1"
        self.addChild(DogeButton1)

        DogeButton2 = SKSpriteNode(imageNamed: "Doge")
        DogeButton2.size = CGSize(width: buttonWidth, height: buttonHeight)
        DogeButton2.position = CGPoint(x: buttonWidth + (buttonWidth / 2.0), y: (buttonHeight * 3.0) + (buttonHeight / 2.0))
        DogeButton2.name = "Doge2"
        self.addChild(DogeButton2)
        
        DogeButton3 = SKSpriteNode(imageNamed: "Doge")
        DogeButton3.size = CGSize(width: buttonWidth, height: buttonHeight)
        DogeButton3.position = CGPoint(x: buttonWidth + (buttonWidth / 2.0), y: (buttonHeight * 2.0) + (buttonHeight / 2.0))
        DogeButton3.name = "Doge3"
        self.addChild(DogeButton3)
        
        DogeButton4 = SKSpriteNode(imageNamed: "Doge")
        DogeButton4.size = CGSize(width: buttonWidth, height: buttonHeight)
        DogeButton4.position = CGPoint(x: buttonWidth + (buttonWidth / 2.0), y: buttonHeight + buttonHeight / 2.0)
        DogeButton4.name = "Doge4"
        self.addChild(DogeButton4)
        
        DogeButton5 = SKSpriteNode(imageNamed: "Doge")
        DogeButton5.size = CGSize(width: buttonWidth, height: buttonHeight)
        DogeButton5.position = CGPoint(x: buttonWidth + (buttonWidth / 2.0), y: buttonHeight / 2.0)
        DogeButton5.name = "Doge5"
        self.addChild(DogeButton5)
        
        randomPlacement1()
        randomPlacement2()
        randomPlacement3()
        randomPlacement4()
        randomPlacement5()

    }
    func randomPlacement1() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
        DogeButton1.position.x = buttonWidth / 2.0
        GrumpyButton1.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton6.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton11.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1:
        DogeButton1.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton1.position.x = buttonWidth / 2.0
        GrumpyButton6.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton11.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2:
        DogeButton1.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton1.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton6.position.x = buttonWidth / 2.0
        GrumpyButton11.position.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3:
        DogeButton1.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton1.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton6.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton11.position.x = buttonWidth / 2.0
            break
        default:
            break
        }
    }
    
    func randomPlacement2() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
        DogeButton2.position.x = buttonWidth / 2.0
        GrumpyButton2.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton7.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton12.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1:
        DogeButton2.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton2.position.x = buttonWidth / 2.0
        GrumpyButton7.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton12.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2:
        DogeButton2.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton2.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton7.position.x = buttonWidth / 2.0
        GrumpyButton12.position.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3:
        DogeButton2.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton2.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton7.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton12.position.x = buttonWidth / 2.0
            break
        default:
            break
        }
    }
    
    func randomPlacement3() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
        DogeButton3.position.x = buttonWidth / 2.0
        GrumpyButton3.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton8.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton13.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1:
        DogeButton3.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton3.position.x = buttonWidth / 2.0
        GrumpyButton8.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton13.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2:
        DogeButton3.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton3.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton8.position.x = buttonWidth / 2.0
        GrumpyButton13.position.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3:
        DogeButton3.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton3.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton8.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton13.position.x = buttonWidth / 2.0
            break
        default:
            break
        }
    }
    
    func randomPlacement4() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
        DogeButton4.position.x = buttonWidth / 2.0
        GrumpyButton4.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton9.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton14.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1:
        DogeButton4.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton4.position.x = buttonWidth / 2.0
        GrumpyButton9.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton14.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2:
        DogeButton4.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton4.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton9.position.x = buttonWidth / 2.0
        GrumpyButton14.position.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3:
        DogeButton4.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton4.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton9.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton14.position.x = buttonWidth / 2.0
            break
        default:
            break
        }
    }
    
    func randomPlacement5() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
        DogeButton5.position.x = buttonWidth / 2.0
        GrumpyButton5.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton10.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton15.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1:
        DogeButton5.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton5.position.x = buttonWidth / 2.0
        GrumpyButton10.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton15.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2:
        DogeButton5.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton5.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton10.position.x = buttonWidth / 2.0
        GrumpyButton15.position.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3:
        DogeButton5.position.x = buttonWidth + (buttonWidth / 2.0)
        GrumpyButton5.position.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
        GrumpyButton10.position.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
        GrumpyButton15.position.x = buttonWidth / 2.0
            break
        default:
            break
        }
    }
}