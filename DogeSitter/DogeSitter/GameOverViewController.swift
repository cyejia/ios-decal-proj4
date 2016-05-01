//
//  GameOverViewController.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/26/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class GameOverViewController= UIViewController {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var game = DontTouchTheGrumpyCatViewController()
    var gameOverLabel = UILabel()

    override func viewDidLoad() { // change top 4 to var
        super.viewDidLoad()
//        let highScoreDefault = NSUserDefaults.standardUserDefaults()
        let scoreDefault = NSUserDefaults.standardUserDefaults()
        
//        print(UIFont.familyNames())
//        for name in UIFont.familyNames() {
//            print(name)
//            if let nameString = name as? String
//            {
//                print(UIFont.fontNamesForFamilyName(nameString))
//            }
//        }
        
        let score = scoreDefault.valueForKey("tempscore") as! NSInteger
        
        gameOverLabel = UILabel(frame= CGRect(x= 0, y= 0, width= screenWidth, height= screenHeight * 0.25))
        gameOverLabel.text = "Game Over"
        gameOverLabel.font = UIFont(name= "ComicSans MS", size= 50.0)
        gameOverLabel.textAlignment = .Center
        gameOverLabel.center = CGPoint(x= screenWidth / 2.0, y= screenHeight * 0.25)
        self.view.addSubview(gameOverLabel)
        
        self.view.backgroundColor = UIColor.whiteColor()
        
//        var scoreLabel = UILabel(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
//        scoreLabel.center = CGPoint(x= self.view.frame.size.width * 0.985, y= 25)
//        scoreLabel.textColor = UIColor.redColor()
//        scoreLabel.text = "\(score)"
//        self.view.addSubview(scoreLabel)
//        
//        var highscoreLabel = UILabel(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
//        highscoreLabel.center = CGPoint(x= self.view.frame.size.width / 2, y= 25)
//        highscoreLabel.textColor = UIColor.redColor()
//        highscoreLabel.text = "\(highscore)"
//        self.view.addSubview(highscoreLabel)
        
//        var backButton = UIButton(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
//        backButton.center = CGPoint(x= self.view.frame.size.width / 2, y= 300)
//        backButton.setTitle("Play Again", forState= UIControlState.Normal)
//        backButton.backgroundColor = UIColor.purpleColor()
//        backButton.addTarget(self, action= Selector("backToGame"), forControlEvents= UIControlEvents.TouchUpInside)
//        self.view.addSubview(backButton)
        
//        NSLog("\(score)")
//        NSLog("\(highscore)")
        
        // Do any additional setup after loading the view.
    }
    
    func backToGame() {
        self.presentViewController(game, animated= true, completion= nil)
        print("back to game")
        self.presentViewController(DontTouchTheGrumpyCatViewController(), animated= true, completion= nil)
        print("view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK= - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue= UIStoryboardSegue, sender= AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
