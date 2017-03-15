//
//  ViewController.swift
//  Great Number Game
//
//  Created by Patrick O'Brien on 3/7/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    @IBOutlet weak var numberGuess: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        makeNumber()
    }
    var number : Int!
    
    @IBAction func submitGuess(_ sender: Any) {


        
        let guess = numberGuess.text!
        if let guess = Int(guess) {
            if Int(guess) < number {
                let alertController = UIAlertController(title: "Too Low", message:
                    "Make another guess!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                numberGuess.text = ""
            }
            else if Int(guess) > number {
                let alertController = UIAlertController(title: "Too High", message:
                    "Make another guess!", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                numberGuess.text = ""
            }
            else if Int(guess)
                == number {
                
                let alertController = UIAlertController(title: "You Win", message:
                    "The answer was \(number!)", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default,handler: nil))
                
                self.present(alertController, animated: true, completion: nil)
                self.playSound()
                self.makeNumber()
                numberGuess.text = ""
            }
        }else{
            
            let alertController = UIAlertController(title: "Invalid Guess", message:
                "\(guess) is not what I asked for :P", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            numberGuess.text = ""
        }

        }
    
    func makeNumber(){
        number = Int(arc4random_uniform(100) + 1)
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Winner", withExtension:".m4a") else {
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
    
        
        
        
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

