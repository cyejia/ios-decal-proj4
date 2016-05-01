//
//  DontTouchTheGrumpyCatGameScene.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/30/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit
import SpriteKit

class DontTouchTheGrumpyCatGameScene: SKScene, SKPhysicsContactDelegate {

    var GrumpyButton1 = SKSpriteNode()
    var GrumpyButton2 = SKSpriteNode()
    var GrumpyButton3 = SKSpriteNode()
    var GrumpyButton4 = SKSpriteNode()
    var GrumpyButton5 = SKSpriteNode()
    var GrumpyButton6 = SKSpriteNode()
    var GrumpyButton7 = SKSpriteNode()
    var GrumpyButton8 = SKSpriteNode()
    var GrumpyButton9 = SKSpriteNode()
    var GrumpyButton10 = SKSpriteNode()
    var GrumpyButton11 = SKSpriteNode()
    var GrumpyButton12 = SKSpriteNode()
    var GrumpyButton13 = SKSpriteNode()
    var GrumpyButton14 = SKSpriteNode()
    var GrumpyButton15 = SKSpriteNode()
    
    
    var DogeButton1 = SKSpriteNode()
    var DogeButton2 = SKSpriteNode()
    var DogeButton3 = SKSpriteNode()
    var DogeButton4 = SKSpriteNode()
    var DogeButton5 = SKSpriteNode()
    
    var buttonWidth = CGFloat()
    var buttonHeight = CGFloat()
    
    var score = Int()
    var timer = NSTimer()
    var timerLabel = UILabel()
    var scoreLabel = UILabel()
    var count = Int()
    var desiredScore = 0
    
    override func didMoveToView(view: SKView) {
        
    }
}
