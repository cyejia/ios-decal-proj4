//
//  DontTouchTheGrumpyCatViewController.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/24/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class DontTouchTheGrumpyCatViewController: UIViewController {

    @IBOutlet var GrumpyButton01: UIButton!
    @IBOutlet var GrumpyButton02: UIButton!
    @IBOutlet var GrumpyButton03: UIButton!
    @IBOutlet var GrumpyButton1: UIButton!
    @IBOutlet var GrumpyButton2: UIButton!
    @IBOutlet var GrumpyButton3: UIButton!
    @IBOutlet var GrumpyButton4: UIButton!
    @IBOutlet var GrumpyButton5: UIButton!
    @IBOutlet var GrumpyButton6: UIButton!
    @IBOutlet var GrumpyButton7: UIButton!
    @IBOutlet var GrumpyButton8: UIButton!
    @IBOutlet var GrumpyButton9: UIButton!
    @IBOutlet var GrumpyButton10: UIButton!
    @IBOutlet var GrumpyButton11: UIButton!
    @IBOutlet var GrumpyButton12: UIButton!
    
    @IBOutlet var DogeButton0: UIButton!
    @IBOutlet var DogeButton1: UIButton!
    @IBOutlet var DogeButton2: UIButton!
    @IBOutlet var DogeButton3: UIButton!
    @IBOutlet var DogeButton4: UIButton!
    
// self.presentviewcontroller with NSTIMER
// need var G2 = viewcontroller type seguing to from in 1st viewcontroller
//viewdidload:
    
    var score = Int()
    var highscore = Int()
    var timer = NSTimer()
    var timerLabel = UILabel()
    var scoreLabel = UILabel()
    var highscoreLabel = UILabel()
    var count = Int()
    var desiredScore = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // how do i make the buttons start off random instead of a straight line?
        var highscoreDefault = NSUserDefaults.standardUserDefaults()
        count = 10
        if (highscoreDefault.valueForKey("highscore") != nil) {
            highscore = highscoreDefault.valueForKey("highscore") as! NSInteger
//            NSLog("\(highscore)")
        } else {
            highscore = 0
        }
        
        desiredScore = desiredScore + 3
        
        scoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        scoreLabel.center = CGPoint(x: self.view.frame.size.width * 0.985, y: 25)
        scoreLabel.textColor = UIColor.redColor()
        scoreLabel.text = "\(score)"
        self.view.addSubview(scoreLabel)
        
        highscoreLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        highscoreLabel.center = CGPoint(x: self.view.frame.size.width * 0.48, y: 25)
        highscoreLabel.textColor = UIColor.redColor()
        highscoreLabel.text = "\(highscore)"
        self.view.addSubview(highscoreLabel)
        
        timerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        timerLabel.center = CGPoint(x: self.view.frame.size.width * 0.23, y: 25)
        timerLabel.textColor = UIColor.redColor()
        timerLabel.text = "\(count)"
        self.view.addSubview(timerLabel)
        
        // Do any additional setup after loading the view.
        
        score = 0 //should this change later on?
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(DontTouchTheGrumpyCatViewController.update), userInfo: nil, repeats: true)
    }
    
    func update() {
        if count > 0 {
            count -= 1
            timerLabel.text = "\(count)"
        }
        if count == 0 && score < desiredScore {
            self.presentViewController(GameOverViewController(), animated: true, completion: nil)
        }
    }
    
    @IBAction func playAgain(segue:UIStoryboardSegue) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func endGame() {
        // end game
    }
    
    @IBAction func touchedAGrumpyCat(sender: AnyObject) {
        self.presentViewController(GameOverViewController(), animated: true, completion: nil)
    }
    
    @IBAction func moveDogeDown(sender: AnyObject) {
        var highscoreDefault = NSUserDefaults.standardUserDefaults()
        var scoreDefault = NSUserDefaults.standardUserDefaults()
        
        score += 1
        scoreDefault.setValue(score, forKey: "tempscore")
        scoreLabel.text = "\(score)"
        
//        NSLog("\(score)")
        
        if (score > highscore) {
            highscore = score
            highscoreDefault.setValue(score, forKey: "highscore")
        }
        
        GrumpyButton01.center.y = GrumpyButton01.center.y + 184
        GrumpyButton02.center.y = GrumpyButton02.center.y + 184
        GrumpyButton03.center.y = GrumpyButton03.center.y + 184
        GrumpyButton1.center.y = GrumpyButton1.center.y + 184
        GrumpyButton2.center.y = GrumpyButton2.center.y + 184
        GrumpyButton3.center.y = GrumpyButton3.center.y + 184
        GrumpyButton4.center.y = GrumpyButton4.center.y + 184
        GrumpyButton5.center.y = GrumpyButton5.center.y + 184
        GrumpyButton6.center.y = GrumpyButton6.center.y + 184
        GrumpyButton7.center.y = GrumpyButton7.center.y + 184
        GrumpyButton8.center.y = GrumpyButton8.center.y + 184
        GrumpyButton9.center.y = GrumpyButton9.center.y + 184
        GrumpyButton10.center.y = GrumpyButton10.center.y + 184
        GrumpyButton11.center.y = GrumpyButton11.center.y + 184
        GrumpyButton12.center.y = GrumpyButton12.center.y + 184
        
        DogeButton0.center.y = DogeButton0.center.y + 184
        DogeButton1.center.y = DogeButton1.center.y + 184
        DogeButton2.center.y = DogeButton2.center.y + 184
        DogeButton3.center.y = DogeButton3.center.y + 184
        DogeButton4.center.y = DogeButton4.center.y + 184
        
        
        if DogeButton0.center.y >= 828 {
            DogeButton0.center.y = -92
            GrumpyButton01.center.y = -92
            GrumpyButton02.center.y = -92
            GrumpyButton03.center.y = -92
            randomPlacement1()
        }
        if DogeButton1.center.y >= 828 {
            DogeButton1.center.y = -92
            GrumpyButton1.center.y = -92
            GrumpyButton2.center.y = -92
            GrumpyButton3.center.y = -92
            randomPlacement2()
        }
        if DogeButton2.center.y >= 828 {
            DogeButton2.center.y = -92
            GrumpyButton4.center.y = -92
            GrumpyButton5.center.y = -92
            GrumpyButton6.center.y = -92
            randomPlacement3()
        }
        if DogeButton3.center.y >= 828 {
            DogeButton3.center.y = -92
            GrumpyButton7.center.y = -92
            GrumpyButton8.center.y = -92
            GrumpyButton9.center.y = -92
            randomPlacement4()
        }
        if DogeButton4.center.y >= 828 {
            DogeButton4.center.y = -92
            GrumpyButton10.center.y = -92
            GrumpyButton11.center.y = -92
            GrumpyButton12.center.y = -92
            randomPlacement5()
        }
    }

    func randomPlacement1() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
            DogeButton0.center.x = 52
            GrumpyButton01.center.x = 156
            GrumpyButton02.center.x = 260
            GrumpyButton03.center.x = 364
            break
        case 1:
            DogeButton0.center.x = 364
            GrumpyButton01.center.x = 52
            GrumpyButton02.center.x = 156
            GrumpyButton03.center.x = 260
            break
        case 2:
            DogeButton0.center.x = 260
            GrumpyButton01.center.x = 364
            GrumpyButton02.center.x = 52
            GrumpyButton03.center.x = 156
            break
        case 3:
            DogeButton0.center.x = 156
            GrumpyButton01.center.x = 260
            GrumpyButton02.center.x = 364
            GrumpyButton03.center.x = 52
            break
        default:
            break
        }
    }
    
    func randomPlacement2() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
            DogeButton1.center.x = 52
            GrumpyButton1.center.x = 156
            GrumpyButton2.center.x = 260
            GrumpyButton3.center.x = 364
            break
        case 1:
            DogeButton1.center.x = 364
            GrumpyButton1.center.x = 52
            GrumpyButton2.center.x = 156
            GrumpyButton3.center.x = 260
            break
        case 2:
            DogeButton1.center.x = 260
            GrumpyButton1.center.x = 364
            GrumpyButton2.center.x = 52
            GrumpyButton3.center.x = 156
            break
        case 3:
            DogeButton1.center.x = 156
            GrumpyButton1.center.x = 260
            GrumpyButton2.center.x = 364
            GrumpyButton3.center.x = 52
            break
        default:
            break
        }
    }
    
    func randomPlacement3() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
            DogeButton2.center.x = 52
            GrumpyButton4.center.x = 156
            GrumpyButton5.center.x = 260
            GrumpyButton6.center.x = 364
            break
        case 1:
            DogeButton2.center.x = 364
            GrumpyButton4.center.x = 52
            GrumpyButton5.center.x = 156
            GrumpyButton6.center.x = 260
            break
        case 2:
            DogeButton2.center.x = 260
            GrumpyButton4.center.x = 364
            GrumpyButton5.center.x = 52
            GrumpyButton6.center.x = 156
            break
        case 3:
            DogeButton2.center.x = 156
            GrumpyButton4.center.x = 260
            GrumpyButton5.center.x = 364
            GrumpyButton6.center.x = 52
            break
        default:
            break
        }
    }
    
    func randomPlacement4() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
            DogeButton3.center.x = 52
            GrumpyButton7.center.x = 156
            GrumpyButton8.center.x = 260
            GrumpyButton9.center.x = 364
            break
        case 1:
            DogeButton3.center.x = 364
            GrumpyButton7.center.x = 52
            GrumpyButton8.center.x = 156
            GrumpyButton9.center.x = 260
            break
        case 2:
            DogeButton3.center.x = 260
            GrumpyButton7.center.x = 364
            GrumpyButton8.center.x = 52
            GrumpyButton9.center.x = 156
            break
        case 3:
            DogeButton3.center.x = 156
            GrumpyButton7.center.x = 260
            GrumpyButton8.center.x = 364
            GrumpyButton9.center.x = 52
            break
        default:
            break
        }
    }
    
    func randomPlacement5() {
        let randomNumber = arc4random() % 4
        switch(randomNumber) {
        case 0:
            DogeButton4.center.x = 52
            GrumpyButton10.center.x = 156
            GrumpyButton11.center.x = 260
            GrumpyButton12.center.x = 364
            break
        case 1:
            DogeButton4.center.x = 364
            GrumpyButton10.center.x = 52
            GrumpyButton11.center.x = 156
            GrumpyButton12.center.x = 260
            break
        case 2:
            DogeButton4.center.x = 260
            GrumpyButton10.center.x = 364
            GrumpyButton11.center.x = 52
            GrumpyButton12.center.x = 156
            break
        case 3:
            DogeButton4.center.x = 156
            GrumpyButton10.center.x = 260
            GrumpyButton11.center.x = 364
            GrumpyButton12.center.x = 52
            break
        default:
            break
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
