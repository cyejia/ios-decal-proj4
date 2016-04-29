//
//  GameViewController.swift
//  DogeSitter2
//
//  Created by Yejia Chen on 4/27/16.
//  Copyright (c) 2016 Yejia Chen. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userDefaults.setValue(Int(0), forKey: "currentLevel")
        if (userDefaults.valueForKey("highScores") == nil) {
            let noScores = NSMutableArray()
            userDefaults.setValue(noScores, forKey: "highScores")
        }
        
        newMiniGame()
        
//        if let scene = Game1(fileNamed: "GameScene") {
//            // Configure the view.
//            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
//            
//            /* Sprite Kit applies additional optimizations to improve rendering performance */
//            skView.ignoresSiblingOrder = true
//            
//            /* Set the scale mode to scale to fit the window */
//            scene.scaleMode = .AspectFill
//            
//            skView.presentScene(scene)
//        }
    }
    
    func newMiniGame() {
        let previousLevel = userDefaults.valueForKey("currentLevel") as! Int
        userDefaults.setValue(Int(previousLevel + 1), forKey: "currentLevel")
        
//        let whichGame = arc4random_uniform(3)
        let whichGame = 0
        var scene : SKScene?
        switch (whichGame) {
        case 0:
            scene = Game1(fileNamed: "GameScene")
        case 1:
            scene = Game2(fileNamed: "GameScene")
        case 2:
            scene = Game3(fileNamed: "GameScene")
        default:
            scene = Game1(fileNamed: "GameScene")
        }
        
        if (scene != nil) {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene!.scaleMode = .AspectFill
            scene!.size = self.view.frame.size

            
            skView.presentScene(scene)
        }
    }
    

    override func shouldAutorotate() -> Bool {
        return false
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Portrait
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
