//
//  POPointsLabel.swift
//  Wall Dodge
//
//  Created by Patrick O'Brien on 3/10/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation



class MLPointsLabel: SKLabelNode {
    var player: AVAudioPlayer?
    var number = 0
    var hero: MLHero!
    
    init(num: Int) {
        super.init()
        
        fontColor = UIColor.black
        fontName = "Helvetica"
        fontSize = 24.0
        
        number = num
        text = "\(num)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func increment() {
        number += 1
        text = "\(number)"
        pointSound()

    }
    
    func pointSound() {
        guard let url = Bundle.main.url(forResource: "Point", withExtension:".mp3") else {
            print("url not found")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player!.play()
        } catch _ as NSError {
            print("Error")
        }
    }
    
    func setTo(_ num: Int) {
        self.number = num
        text = "\(self.number)"
    }
    
}
