//
//  MonsterImg.swift
//  mylittlemonster
//
//  Created by Nick on 2016-01-18.
//  Copyright © 2016 Nicholas Ivanecky. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    var newImage: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
  
    
    func playIdleAnimation() {
        
        
        self.image = UIImage(named: "idle1.png")
        self.animationImages = nil
        
        var imgArr = [UIImage]()
        for var x = 1; x <= 4; x++ {
            let img = UIImage(named: "idle\(x).png")
            imgArr.append(img!)
        }
        
        self.animationImages = imgArr
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func playDeathAnimation() {
        
        //set the final image
        self.image = UIImage(named: "dead5.png")
        self.animationImages = nil
        
        var imgArr = [UIImage]()
        for var x = 1; x <= 5; x++ {
            let img = UIImage(named: "dead\(x).png")
            imgArr.append(img!)
        }
        
        self.animationImages = imgArr
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
}