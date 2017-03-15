//
//  POHero.swift
//  Wall Dodge
//
//  Created by Patrick O'Brien on 3/10/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import SpriteKit

class MLHero: SKSpriteNode {
    
    var body: SKSpriteNode!
    var arm: SKSpriteNode!
    var leftFoot: SKSpriteNode!
    var rightFoot: SKSpriteNode!
    var hair: SKSpriteNode!
    
    var isUpsideDown = false
    
    init() {
        let size = CGSize(width: 32, height: 44)
        super.init(texture: nil, color: UIColor.clear, size: size)
        
        loadAppearance()
        loadPhysicsBodyWithSize(size)
    }
    
    func loadAppearance() {
        
        hair = SKSpriteNode(color: UIColor.yellow, size: CGSize(width: self.frame.size.width, height: 40))
        hair.position = CGPoint(x: -4, y: 8)
        addChild(hair)
        
        body = SKSpriteNode(color: UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1.0), size: CGSize(width: self.frame.size.width, height: 40))
        body.position = CGPoint(x: 0, y: 2)
        addChild(body)
        
        let skinColor = UIColor(red: 255.0/255.0, green: 224.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        let face = SKSpriteNode(color: skinColor, size: CGSize(width: self.frame.size.width, height: 12))
        face.position = CGPoint(x: 0, y: 6)
        body.addChild(face)
        
        let eyeColor = UIColor.white
        let leftEye = SKSpriteNode(color: eyeColor, size: CGSize(width: 6, height: 6))
        let rightEye = leftEye.copy() as! SKSpriteNode
        let pupil = SKSpriteNode(color: UIColor.black, size: CGSize(width: 3, height: 3))
        
        pupil.position = CGPoint(x: 2, y: 0)
        leftEye.addChild(pupil)
        rightEye.addChild(pupil.copy() as! SKSpriteNode)
        
        leftEye.position = CGPoint(x: -8, y: 0)
        face.addChild(leftEye)
        
        rightEye.position = CGPoint(x: 10, y: 0)
        face.addChild(rightEye)
        
        let eyebrow = SKSpriteNode(color: UIColor.black, size: CGSize(width: 11, height: 1))
        let rotateBack = SKAction.rotate(byAngle: CGFloat(M_PI) / 14, duration: 0.4)
        eyebrow.position = CGPoint(x: -1, y: leftEye.size.height/2)
        eyebrow.run(rotateBack)
        leftEye.addChild(eyebrow)
        rightEye.addChild(eyebrow.copy() as! SKSpriteNode)
        
        let armColor = UIColor(red: 255/255, green: 182/255, blue: 193/255, alpha: 1.0)
        arm = SKSpriteNode(color: armColor, size: CGSize(width: 8, height: 14))
        arm.anchorPoint = CGPoint(x: 0.5, y: 0.9)
        arm.position = CGPoint(x: -10, y: -7)
        body.addChild(arm)
        
        let hand = SKSpriteNode(color: skinColor, size: CGSize(width: arm.size.width, height: 5))
        hand.position = CGPoint(x: 0, y: -arm.size.height*0.9 + hand.size.height/2)
        arm.addChild(hand)
        
        leftFoot = SKSpriteNode(color: UIColor.black, size: CGSize(width: 9, height: 4))
        leftFoot.position = CGPoint(x: -6, y: -size.height/2 + leftFoot.size.height/2)
        addChild(leftFoot)
        
        rightFoot = leftFoot.copy() as! SKSpriteNode
        rightFoot.position.x = 8
        addChild(rightFoot)
    }
    
    func loadPhysicsBodyWithSize(_ size: CGSize) {
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.categoryBitMask = heroCategory
        physicsBody?.contactTestBitMask = wallCategory
        physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func flip() {
        isUpsideDown = !isUpsideDown
        
        var scale: CGFloat!
        if isUpsideDown {
            scale = -1.0
        } else {
            scale = 1.0
        }
        let translate = SKAction.moveBy(x: 0, y: scale*(size.height + kMLGroundHeight), duration: 0.1)
        let flip = SKAction.scaleY(to: scale, duration: 0.1)
        
        run(translate)
        run(flip)
    }
    
    func jump(sender: UISwipeGestureRecognizer) {
        isUpsideDown = !isUpsideDown
        
        var scale: CGFloat!
        if isUpsideDown {
            scale = -1.0
        } else {
            scale = 1.0
        }
        let translate = SKAction.moveBy(x: 0, y: scale*(size.height + kMLGroundHeight), duration: 0.1)
        let jumpUp = SKAction.moveBy(x: 0, y: 100, duration: 0.6)
        let fallDown = SKAction.moveBy(x: 0, y: -100, duration: 0.4)
        let jumping = SKAction.sequence([jumpUp, fallDown])
        run(translate)
        run(jumping)
    
    }
    
    func fall() {
        physicsBody?.affectedByGravity = true
        physicsBody?.applyImpulse(CGVector(dx: -5, dy: 30))
        
        let rotateBack = SKAction.rotate(byAngle: CGFloat(M_PI) / 2, duration: 0.4)
        run(rotateBack)
    }
    
    func startRunning() {
        let rotateBack = SKAction.rotate(byAngle: -CGFloat(M_PI)/2.0, duration: 0.1)
        arm.run(rotateBack)
        
        performOneRunCycle()
    }
    
    func performOneRunCycle() {
        let up = SKAction.moveBy(x: 0, y: 2, duration: 0.05)
        let down = SKAction.moveBy(x: 0, y: -2, duration: 0.05)
        
        leftFoot.run(up, completion: { () -> Void in
            self.leftFoot.run(down)
            self.rightFoot.run(up, completion: { () -> Void in
                self.rightFoot.run(down, completion: { () -> Void in
                    self.performOneRunCycle()
                })
            })
        })
    }
    
    func breathe() {
        let breatheOut = SKAction.moveBy(x: 0, y: -2, duration: 1)
        let breatheIn = SKAction.moveBy(x: 0, y: 2, duration: 1)
        let breath = SKAction.sequence([breatheOut, breatheIn])
        body.run(SKAction.repeatForever(breath))
    }
    
    func stop() {
        body.removeAllActions()
        leftFoot.removeAllActions()
        rightFoot.removeAllActions()
    }
    
    
    
    
}
