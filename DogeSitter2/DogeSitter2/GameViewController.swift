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
        
        if (userDefaults.valueForKey("highScore") == nil) {
            userDefaults.setValue(Int(0), forKey: "highScore")
        }
        
        userDefaults.setValue(Int(0), forKey: "currentLevel")


        
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
        
        if let scene = Game1(fileNamed: "GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = false
            skView.showsNodeCount = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            scene.size = self.view.frame.size

            
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
