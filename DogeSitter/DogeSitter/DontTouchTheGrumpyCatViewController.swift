//
//  DontTouchTheGrumpyCatViewController.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/24/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class DontTouchTheGrumpyCatViewController= UIViewController {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    var row1= [UIButton] = []
    var row2= [UIButton] = []
    var row3= [UIButton] = []
    var row4= [UIButton] = []
    var row5= [UIButton] = []
    
    var GrumpyButton1= SKSpriteNode()
    var GrumpyButton2= SKSpriteNode()
    var GrumpyButton3= SKSpriteNode()
    var GrumpyButton4= SKSpriteNode()
    var GrumpyButton5= SKSpriteNode()
    var GrumpyButton6= SKSpriteNode()
    var GrumpyButton7= SKSpriteNode()
    var GrumpyButton8= SKSpriteNode()
    var GrumpyButton9= SKSpriteNode()
    var GrumpyButton10= SKSpriteNode()
    var GrumpyButton11= SKSpriteNode()
    var GrumpyButton12= SKSpriteNode()
    var GrumpyButton13= SKSpriteNode()
    var GrumpyButton14= SKSpriteNode()
    var GrumpyButton15= SKSpriteNode()
    
    
    var DogeButton1= SKSpriteNode()
    var DogeButton2= SKSpriteNode()
    var DogeButton3= SKSpriteNode()
    var DogeButton4= SKSpriteNode()
    var DogeButton5= SKSpriteNode()
    
    var buttonWidth = CGFloat()
    var buttonHeight = CGFloat()
    
    var score = Int()
    var timer = NSTimer()
    var timerLabel = UILabel()
    var scoreLabel = UILabel()
    var count = Int()
    var desiredScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        buttonWidth = screenWidth / 4
        buttonHeight = screenHeight / 4
        
        count = 10
        desiredScore = desiredScore + 3
        
        score = 0 //should this change later on?
        
        GrumpyButton1 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton1.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton1.center = CGPoint(x= buttonWidth / 2.0, y= 0 - (buttonHeight / 2.0))
        GrumpyButton1.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row1.append(GrumpyButton1)
        self.view.addSubview(GrumpyButton1)
        
        GrumpyButton2 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton2.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton2.center = CGPoint(x= buttonWidth / 2.0, y= buttonHeight / 2.0)
        GrumpyButton2.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row2.append(GrumpyButton2)
        self.view.addSubview(GrumpyButton2)
        
        GrumpyButton3 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton3.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton3.center = CGPoint(x= buttonWidth / 2.0, y= buttonHeight + (buttonHeight / 2.0))
        GrumpyButton3.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row3.append(GrumpyButton3)
        self.view.addSubview(GrumpyButton3)
        
        GrumpyButton4 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton4.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton4.center = CGPoint(x= buttonWidth / 2.0, y= (buttonHeight * 2.0) + (buttonHeight / 2.0))
        GrumpyButton4.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row4.append(GrumpyButton4)
        self.view.addSubview(GrumpyButton4)
        
        GrumpyButton5 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton5.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton5.center = CGPoint(x= buttonWidth / 2.0, y= (buttonHeight * 3.0) + (buttonHeight / 2.0))
        GrumpyButton5.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row5.append(GrumpyButton5)
        self.view.addSubview(GrumpyButton5)
        
        GrumpyButton6 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton6.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton6.center = CGPoint(x= (buttonWidth * 2.0) + (buttonWidth / 2.0), y= 0 - (buttonHeight / 2.0))
        GrumpyButton6.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row1.append(GrumpyButton6)
        self.view.addSubview(GrumpyButton6)
        
        GrumpyButton7 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton7.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton7.center = CGPoint(x= (buttonWidth * 2.0) + (buttonWidth / 2.0), y= buttonHeight / 2.0)
        GrumpyButton7.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row2.append(GrumpyButton7)
        self.view.addSubview(GrumpyButton7)
        
        GrumpyButton8 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton8.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton8.center = CGPoint(x= (buttonWidth * 2.0) + (buttonWidth / 2.0), y= buttonHeight + (buttonHeight / 2.0))
        GrumpyButton8.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row3.append(GrumpyButton8)
        self.view.addSubview(GrumpyButton8)
        
        GrumpyButton9 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton9.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton9.center = CGPoint(x= (buttonWidth * 2.0) + (buttonWidth / 2.0), y= (buttonHeight * 2.0) + (buttonHeight / 2.0))
        GrumpyButton9.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row4.append(GrumpyButton9)
        self.view.addSubview(GrumpyButton9)
        
        GrumpyButton10 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton10.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton10.center = CGPoint(x= (buttonWidth * 2.0) + (buttonWidth / 2.0), y= (buttonHeight * 3.0) + (buttonHeight / 2.0))
        GrumpyButton10.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row5.append(GrumpyButton10)
        self.view.addSubview(GrumpyButton10)
        
        GrumpyButton11 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton11.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton11.center = CGPoint(x= (buttonWidth * 3.0) + (buttonWidth / 2.0), y= 0 - (buttonHeight / 2.0))
        GrumpyButton11.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row1.append(GrumpyButton11)
        self.view.addSubview(GrumpyButton11)
        
        GrumpyButton12 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton12.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton12.center = CGPoint(x= (buttonWidth * 3.0) + (buttonWidth / 2.0), y= buttonHeight / 2.0)
        GrumpyButton12.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row2.append(GrumpyButton12)
        self.view.addSubview(GrumpyButton12)
        
        GrumpyButton13 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton13.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton13.center = CGPoint(x= (buttonWidth * 3.0) + (buttonWidth / 2.0), y= buttonHeight + (buttonHeight / 2.0))
        GrumpyButton13.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row3.append(GrumpyButton13)
        self.view.addSubview(GrumpyButton13)
        
        GrumpyButton14 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton14.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton14.center = CGPoint(x= (buttonWidth * 3.0) + (buttonWidth / 2.0), y= (buttonHeight * 2.0) + (buttonHeight / 2.0))
        GrumpyButton14.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row4.append(GrumpyButton14)
        self.view.addSubview(GrumpyButton14)
        
        GrumpyButton15 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        GrumpyButton15.setBackgroundImage(UIImage(named= "GrumpyCat.jpg"), forState= UIControlState.Normal)
        GrumpyButton15.center = CGPoint(x= (buttonWidth * 3.0) + (buttonWidth / 2.0), y= (buttonHeight * 3.0) + (buttonHeight / 2.0))
        GrumpyButton15.addTarget(self, action= #selector(touchedAGrumpyCat), forControlEvents= UIControlEvents.TouchUpInside)
        row5.append(GrumpyButton15)
        self.view.addSubview(GrumpyButton15)
        
        DogeButton1 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        DogeButton1.setBackgroundImage(UIImage(named= "Doge.jpg"), forState= UIControlState.Normal)
        DogeButton1.center = CGPoint(x= buttonWidth + (buttonWidth / 2.0), y= 0 - (buttonHeight / 2.0))
        DogeButton1.addTarget(self, action= #selector(moveDogeDown), forControlEvents= UIControlEvents.TouchUpInside)
        row1.append(DogeButton1)
        self.view.addSubview(DogeButton1)
        
        DogeButton2 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        DogeButton2.setBackgroundImage(UIImage(named= "Doge.jpg"), forState= UIControlState.Normal)
        DogeButton2.center = CGPoint(x= buttonWidth + (buttonWidth / 2.0), y= buttonHeight / 2.0)
        DogeButton2.addTarget(self, action= #selector(moveDogeDown), forControlEvents= UIControlEvents.TouchUpInside)
        row2.append(DogeButton2)
        self.view.addSubview(DogeButton2)
        
        DogeButton3 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        DogeButton3.setBackgroundImage(UIImage(named= "Doge.jpg"), forState= UIControlState.Normal)
        DogeButton3.center = CGPoint(x= buttonWidth + (buttonWidth / 2.0), y= buttonHeight + (buttonHeight / 2.0))
        DogeButton3.addTarget(self, action= #selector(moveDogeDown), forControlEvents= UIControlEvents.TouchUpInside)
        row3.append(DogeButton3)
        self.view.addSubview(DogeButton3)
        
        DogeButton4 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        DogeButton4.setBackgroundImage(UIImage(named= "Doge.jpg"), forState= UIControlState.Normal)
        DogeButton4.center = CGPoint(x= buttonWidth + (buttonWidth / 2.0), y= (buttonHeight * 2.0) + (buttonHeight / 2.0))
        DogeButton4.addTarget(self, action= #selector(moveDogeDown), forControlEvents= UIControlEvents.TouchUpInside)
        row4.append(DogeButton4)
        self.view.addSubview(DogeButton4)
        
        DogeButton5 = UIButton(frame= CGRect(x= 0, y= 0, width= buttonWidth, height= buttonHeight))
        DogeButton5.setBackgroundImage(UIImage(named= "Doge.jpg"), forState= UIControlState.Normal)
        DogeButton5.center = CGPoint(x= buttonWidth + (buttonWidth / 2.0), y= (buttonHeight * 3.0) + (buttonHeight / 2.0))
        DogeButton5.addTarget(self, action= #selector(moveDogeDown), forControlEvents= UIControlEvents.TouchUpInside)
        row5.append(DogeButton5)
        self.view.addSubview(DogeButton5)
        
        randomPlacement1()
        randomPlacement2()
        randomPlacement3()
        randomPlacement4()
        randomPlacement5()
        
        scoreLabel = UILabel(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
        scoreLabel.center = CGPoint(x= screenWidth * 0.985, y= buttonHeight * 0.18)
        scoreLabel.textColor = UIColor.redColor()
        scoreLabel.text = "\(score)"
        self.view.addSubview(scoreLabel)
        
        timerLabel = UILabel(frame= CGRect(x= 0, y= 0, width= 100, height= 20))
        timerLabel.center = CGPoint(x= screenWidth * 0.235, y= buttonHeight * 0.18)
        timerLabel.textColor = UIColor.redColor()
        timerLabel.text = "\(count)"
        self.view.addSubview(timerLabel)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target= self, selector= #selector(DontTouchTheGrumpyCatViewController.update), userInfo= nil, repeats= true)
    }
    
    func update() {
        if count > 0 {
            count -= 1
            timerLabel.text = "\(count)"
        }
        
        if score > 9 {
            scoreLabel.center = CGPoint(x= screenWidth * 0.98, y= buttonHeight * 0.18)
        }
        
        if count == 0 && score < desiredScore {
            self.presentViewController(GameOverViewController(), animated= true, completion= nil)
        }
    }
    
    @IBAction func playAgain(segue=UIStoryboardSegue) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchedAGrumpyCat(sender= AnyObject) {
        self.presentViewController(GameOverViewController(), animated= true, completion= nil)
    }
    
    @IBAction func moveDogeDown(sender= AnyObject) {
        if sender.center.y != (buttonHeight * 3) + (buttonHeight / 2) {
            self.presentViewController(GameOverViewController(), animated= true, completion= nil)
        }
        let scoreDefault = NSUserDefaults.standardUserDefaults()
        score += 1
        scoreDefault.setValue(score, forKey= "tempscore")
        scoreLabel.text = "\(score)"
        
        GrumpyButton1.center.y = GrumpyButton1.center.y + buttonHeight
        GrumpyButton2.center.y = GrumpyButton2.center.y + buttonHeight
        GrumpyButton3.center.y = GrumpyButton3.center.y + buttonHeight
        GrumpyButton4.center.y = GrumpyButton4.center.y + buttonHeight
        GrumpyButton5.center.y = GrumpyButton5.center.y + buttonHeight
        GrumpyButton6.center.y = GrumpyButton6.center.y + buttonHeight
        GrumpyButton7.center.y = GrumpyButton7.center.y + buttonHeight
        GrumpyButton8.center.y = GrumpyButton8.center.y + buttonHeight
        GrumpyButton9.center.y = GrumpyButton9.center.y + buttonHeight
        GrumpyButton10.center.y = GrumpyButton10.center.y + buttonHeight
        GrumpyButton11.center.y = GrumpyButton11.center.y + buttonHeight
        GrumpyButton12.center.y = GrumpyButton12.center.y + buttonHeight
        GrumpyButton13.center.y = GrumpyButton13.center.y + buttonHeight
        GrumpyButton14.center.y = GrumpyButton14.center.y + buttonHeight
        GrumpyButton15.center.y = GrumpyButton15.center.y + buttonHeight
        
        DogeButton1.center.y = DogeButton1.center.y + buttonHeight
        DogeButton2.center.y = DogeButton2.center.y + buttonHeight
        DogeButton3.center.y = DogeButton3.center.y + buttonHeight
        DogeButton4.center.y = DogeButton4.center.y + buttonHeight
        DogeButton5.center.y = DogeButton5.center.y + buttonHeight
        
        if DogeButton1.center.y >= screenHeight + (buttonHeight / 2.0) {
            DogeButton1.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton1.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton6.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton11.center.y = 0 - (buttonHeight / 2.0)
            randomPlacement1()
        }
        if DogeButton2.center.y >= screenHeight + (buttonHeight / 2.0) {
            DogeButton2.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton2.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton7.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton12.center.y = 0 - (buttonHeight / 2.0)
            randomPlacement2()
        }
        if DogeButton3.center.y >= screenHeight + (buttonHeight / 2.0) {
            DogeButton3.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton3.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton8.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton13.center.y = 0 - (buttonHeight / 2.0)
            randomPlacement3()
        }
        if DogeButton4.center.y >= screenHeight + (buttonHeight / 2.0) {
            DogeButton4.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton4.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton9.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton14.center.y = 0 - (buttonHeight / 2.0)
            randomPlacement5()
        }
        
        if DogeButton5.center.y >= screenHeight + (buttonHeight / 2.0) {
            DogeButton5.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton5.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton10.center.y = 0 - (buttonHeight / 2.0)
            GrumpyButton15.center.y = 0 - (buttonHeight / 2.0)
            randomPlacement5()
        }
    }
    
    func randomPlacement1() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0=
            DogeButton1.center.x = buttonWidth / 2.0
            GrumpyButton1.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton6.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton11.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1=
            DogeButton1.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton1.center.x = buttonWidth / 2.0
            GrumpyButton6.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton11.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2=
            DogeButton1.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton1.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton6.center.x = buttonWidth / 2.0
            GrumpyButton11.center.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3=
            DogeButton1.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton1.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton6.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton11.center.x = buttonWidth / 2.0
            break
        default=
            break
        }
    }
    
    func randomPlacement2() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0=
            DogeButton2.center.x = buttonWidth / 2.0
            GrumpyButton2.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton7.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton12.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1=
            DogeButton2.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton2.center.x = buttonWidth / 2.0
            GrumpyButton7.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton12.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2=
            DogeButton2.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton2.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton7.center.x = buttonWidth / 2.0
            GrumpyButton12.center.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3=
            DogeButton2.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton2.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton7.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton12.center.x = buttonWidth / 2.0
            break
        default=
            break
        }
    }
    
    func randomPlacement3() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0=
            DogeButton3.center.x = buttonWidth / 2.0
            GrumpyButton3.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton8.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton13.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1=
            DogeButton3.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton3.center.x = buttonWidth / 2.0
            GrumpyButton8.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton13.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2=
            DogeButton3.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton3.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton8.center.x = buttonWidth / 2.0
            GrumpyButton13.center.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3=
            DogeButton3.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton3.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton8.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton13.center.x = buttonWidth / 2.0
            break
        default=
            break
        }
    }
    
    func randomPlacement4() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0=
            DogeButton4.center.x = buttonWidth / 2.0
            GrumpyButton4.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton9.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton14.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1=
            DogeButton4.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton4.center.x = buttonWidth / 2.0
            GrumpyButton9.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton14.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2=
            DogeButton4.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton4.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton9.center.x = buttonWidth / 2.0
            GrumpyButton14.center.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3=
            DogeButton4.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton4.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton9.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton14.center.x = buttonWidth / 2.0
            break
        default=
            break
        }
    }
    
    func randomPlacement5() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0=
            DogeButton5.center.x = buttonWidth / 2.0
            GrumpyButton5.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton10.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton15.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            break
        case 1=
            DogeButton5.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton5.center.x = buttonWidth / 2.0
            GrumpyButton10.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton15.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            break
        case 2=
            DogeButton5.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton5.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton10.center.x = buttonWidth / 2.0
            GrumpyButton15.center.x = buttonWidth + (buttonWidth / 2.0)
            break
        case 3=
            DogeButton5.center.x = buttonWidth + (buttonWidth / 2.0)
            GrumpyButton5.center.x = (buttonWidth  * 2.0) + (buttonWidth / 2.0)
            GrumpyButton10.center.x = (buttonWidth  * 3.0) + (buttonWidth / 2.0)
            GrumpyButton15.center.x = buttonWidth / 2.0
            break
        default=
            break
        }
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
