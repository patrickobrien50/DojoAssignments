//
//  ViewController.swift
//  Ninja Gold
//
//  Created by Patrick O'Brien on 3/6/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    let colors: [UIColor] = [.red, .blue, .purple, .green, .orange, .yellow]
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var farmLabel: UILabel!
    @IBOutlet weak var caveLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var casinoLabel: UILabel!
    @IBAction func farmButton(_ sender: Any) {
        let randomColor = Int(arc4random_uniform(6))
        scoreLabel.backgroundColor = colors[randomColor]
        farmLabel.isHidden = false
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        let farmGold = arc4random_uniform(11) + 10
        score += Int(farmGold)
        farmLabel.text = "You earned \(farmGold) Gold!"
        scoreLabel.text = "Score: \(score)"
    }
   
    @IBAction func caveButton(_ sender: Any) {
        let randomColor = Int(arc4random_uniform(6))
        scoreLabel.backgroundColor = colors[randomColor]
        farmLabel.isHidden = true
        caveLabel.isHidden = false
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        let caveGold = arc4random_uniform(6) + 5
        score += Int(caveGold)
        caveLabel.text = "You earned \(caveGold) Gold!"
        scoreLabel.text = "Score: \(score)"
    }
    @IBAction func houseButton(_ sender: Any) {
        let randomColor = Int(arc4random_uniform(6))
        scoreLabel.backgroundColor = colors[randomColor]
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = false
        casinoLabel.isHidden = true
        let houseGold = arc4random_uniform(4) + 2
        score += Int(houseGold)
        houseLabel.text = "You earned \(houseGold) Gold!"
        scoreLabel.text = "Score: \(score)"
    }
    @IBAction func casinoButton(_ sender: Any) {
        let randomColor = Int(arc4random_uniform(6))
        scoreLabel.backgroundColor = colors[randomColor]
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = false
        let casinoGold = arc4random_uniform(51)
        let chance = arc4random_uniform(2)
        if chance == 1{
            score += Int(casinoGold)
            casinoLabel.text = "You earned \(casinoGold) Gold!"
        } else {
            
            score -= Int(casinoGold)
            casinoLabel.text = "You lost \(casinoGold) Gold"
        }
        scoreLabel.text = "Score: \(score)"
    }
    @IBAction func resetButton(_ sender: Any) {
        scoreLabel.backgroundColor = UIColor.white
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        score = 0
        scoreLabel.text = "Score: \(score)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scoreLabel.text = "Score: 0"
        farmLabel.isHidden = true
        caveLabel.isHidden = true
        houseLabel.isHidden = true
        casinoLabel.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

