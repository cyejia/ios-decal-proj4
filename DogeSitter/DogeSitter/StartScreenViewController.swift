//
//  StartScreenViewController.swift
//  DogeSitter
//
//  Created by Christine Chen on 4/28/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class StartScreenViewController: UIViewController {
    
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height
    
    
    var backgroundImage = UIImageView()
    var titleLabel = UILabel()
    var beginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        backgroundImage.center = CGPoint(x: screenWidth / 2.0, y: screenHeight / 2.0)
        backgroundImage.image = UIImage(named: "dogeStart.jpg")
        print(backgroundImage.image)
        self.view.addSubview(backgroundImage)
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight / 5.0))
        titleLabel.textAlignment = .Center
        titleLabel.center = CGPoint(x: screenWidth / 2.0, y: screenHeight / 4.0)
        titleLabel.text = "DogeSitter"
        titleLabel.font = UIFont(name: "HelveticaNue", size: 50.0)
        self.view.addSubview(titleLabel)
        
        beginButton = UIButton(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight / 7.0))
        beginButton.setTitle("Start", forState: .Normal)
        beginButton.center = CGPoint(x: screenWidth / 2.0, y: (screenHeight / 4.0) + 30)
        beginButton.addTarget(self, action: #selector(gameSegue), forControlEvents: .TouchUpInside)
        self.view.addSubview(beginButton)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gameSegue(sender: AnyObject?) {
        self.presentViewController(DontTouchTheGrumpyCatViewController(), animated: true, completion: nil)
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
