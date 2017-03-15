//
//  ViewController.swift
//  Cold Call
//
//  Created by Patrick O'Brien on 3/6/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    let nameBank = ["Patrick", "Basila", "Arnold", "John", "Jaxon", "Noah"]
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBAction func callButton(_ sender: Any) {
        let randomNumber = arc4random_uniform(5) + 1
        let nameNumber = arc4random_uniform(6)
        numberLabel.isHidden = false
        nameLabel.text = nameBank[Int(nameNumber)]
        numberLabel.text = "\(randomNumber)"
        if randomNumber == 1 || randomNumber == 2 {
            numberLabel.textColor = UIColor.red
        } else if randomNumber == 3 || randomNumber == 4 {
            numberLabel.textColor = UIColor.orange
        } else {
            numberLabel.textColor = UIColor.green
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberLabel.isHidden = true
        nameLabel.text = "Ready?"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

