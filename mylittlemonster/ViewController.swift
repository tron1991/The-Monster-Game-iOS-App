//
//  ViewController.swift
//  mylittlemonster
//
//  Created by Nick on 2016-01-18.
//  Copyright © 2016 Nicholas Ivanecky. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    //MARK: Properties and Variables
    
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var penalty1Image: UIImageView!
    @IBOutlet weak var penalty2Image: UIImageView!
    @IBOutlet weak var penalty3Image: UIImageView!
    
    var toPass: String!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    var monsterhappy = false
    var currentItem: UInt32 = 0
    
    var caveSound: AVAudioPlayer?
    var deathSound : AVAudioPlayer?
    var heartSound: AVAudioPlayer?
    var biteSound : AVAudioPlayer?
    var skullSound: AVAudioPlayer?
    
    
    @IBAction func menuButtonPressed(sender: AnyObject) {
        caveSound?.stop()
    }
    
    func restartGameParameters() {
        penalties = 0
        penalty1Image.alpha = DIM_ALPHA
        penalty2Image.alpha = DIM_ALPHA
        penalty3Image.alpha = DIM_ALPHA
        
        heartImg.hidden = false
        foodImg.hidden = false
        
        monsterhappy = true
        startTimer()
        monsterImg.playIdleAnimation()
        caveSound?.play()

    }
    
    @IBAction func resetGameButtonTapped(sender: AnyObject) {
       restartGameParameters()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        foodImg.dropTarget = monsterImg //basically saying that foodImg is the droptarget for the monesterimg, so when the food hits the monster picture it will notify the UI
        heartImg.dropTarget = monsterImg
        
        penalty1Image.alpha = DIM_ALPHA
        penalty2Image.alpha = DIM_ALPHA
        penalty3Image.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnCharacter:", name: "onTargetDropped", object: nil)
        
        startTimer()
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if let caveNoise = self.setupAudioPlayerWithFile("cave-music", type: "mp3") {
            self.caveSound = caveNoise
        }
        
        if let deathNoise = self.setupAudioPlayerWithFile("death", type: "wav") {
            self.deathSound = deathNoise
        }
        
        if let heartNoise = self.setupAudioPlayerWithFile("heart", type: "wav") {
            self.heartSound = heartNoise
        }
        
        if let biteNoise = self.setupAudioPlayerWithFile("bite", type: "wav") {
            self.biteSound = biteNoise
        }
        if let skullNoise = self.setupAudioPlayerWithFile("skull", type: "wav") {
            self.skullSound = skullNoise
        }
        
        caveSound?.volume = 0.1
        caveSound?.play()

    }
    
    override func viewDidDisappear(animated: Bool) {
        caveSound?.stop()
        heartSound?.stop()
        biteSound?.stop()
        skullSound?.volume = 0
        deathSound?.volume = 0
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterhappy = true
        startTimer()
        
        foodImg.alpha = DIM_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = DIM_ALPHA
        heartImg.userInteractionEnabled = false
        
        if currentItem == 0 {
            heartSound?.play()
        } else {
            biteSound?.play()
        }
        
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
}
    
    func changeGameState() {
        
        if !monsterhappy {
        penalties++
        
        if penalties == 1 {
            skullSound?.play()
            penalty1Image.alpha = OPAQUE
            penalty2Image.alpha = DIM_ALPHA
            penalty3Image.alpha = DIM_ALPHA
        } else if penalties == 2 {
            skullSound?.play()
            penalty2Image.alpha = OPAQUE
            penalty3Image.alpha = DIM_ALPHA
        } else if penalties == 3 {
            penalty3Image.alpha = OPAQUE
            skullSound?.play()
           
        } else {
            penalty1Image.alpha = DIM_ALPHA
            penalty2Image.alpha = DIM_ALPHA
            penalty3Image.alpha = DIM_ALPHA
        }
        
        if penalties >= MAX_PENALTIES {
            gameOver()
          
        }
    }
        let rand = arc4random_uniform(2) // 0 or 1
        
        if rand == 0 {
            foodImg.alpha = DIM_ALPHA
            foodImg.userInteractionEnabled = false
            
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
            
        } else {
            heartImg.alpha = DIM_ALPHA
            heartImg.userInteractionEnabled = false
            
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
           
        }
        
        currentItem = rand
        monsterhappy = false
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
        deathSound?.play()
        heartImg.hidden = true
        foodImg.hidden = true
     
    }
    
    //Helper Class with Sound
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }
    
}

