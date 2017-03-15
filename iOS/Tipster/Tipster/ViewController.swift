//
//  ViewController.swift
//  Tipster
//
//  Created by Patrick O'Brien on 3/7/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var decimalKey: UIButton!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet weak var fivePercentTotal: UILabel!
    
    @IBOutlet weak var tenPercentTotal: UILabel!
    
    @IBOutlet weak var fifteenPercentTotal: UILabel!
    
    @IBOutlet weak var fifteenPercentTip: UILabel!
    
    @IBOutlet weak var tenPercentTip: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var fivePercentTip: UILabel!
    
    @IBOutlet weak var slider1: UISlider!
    
    @IBOutlet weak var fivePercentLabel: UILabel!
    
    @IBOutlet weak var tenPercentLabel: UILabel!
    
    @IBOutlet weak var fifteenPercentLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    
    @IBOutlet weak var groupSlider: UISlider!
    
    @IBAction func percentSlider(_ sender: UISlider) {
        let fivePercent = Int(sender.value) + 5
        let tenPercent = Int(sender.value) + 10
        let fifteenPercent = Int(sender.value) + 15
        fivePercentLabel.text = String(fivePercent) + "%"
        tenPercentLabel.text = String(tenPercent) + "%"
        fifteenPercentLabel.text = String(fifteenPercent) + "%"
        crunchNumbers()
        
    }
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        let groupSize = Int(sender.value)
        groupSizeLabel.text = "Group Size: \(groupSize)"
        crunchNumbers()
    }

    @IBAction func numberPressed(_ sender: UIButton) {
        if priceLabel.text == "0" && sender.tag < 10 {
            priceLabel.text = String(sender.tag)
        }
        else if priceLabel.text == "0" && sender.tag == 12{
            priceLabel.text = "0."
        }
        else if sender.tag < 10{
            if let priceInput = priceLabel.text {
                priceLabel.text = priceInput + String(sender.tag)
            }
        }
        else if sender.tag == 12 {
            if let priceText = priceLabel.text{
                priceLabel.text = priceText + "."
                sender.isEnabled = false
            }
        }
        else if sender.tag == 11{
            priceLabel.text = "0"
            decimalKey.isEnabled = true
            
        }
        crunchNumbers()
    }
    func crunchNumbers(){
        if let priceString = priceLabel.text {
            let input = Double(priceString)
            let tip = Double(round(tipSlider.value))
            let group = Double(round(groupSlider.value))
            let minimumTip = round((input! * (tip + 5/100))*100)/100
            let minPerPerson = (round(((input! + minimumTip)/group)*100))/100
            let mediumTip = round((input! * ((tip + 10)/100))*100)/100
            let medPerPerson = (round(((input! + mediumTip)/group)*100))/100
            let maximumTip = round((input! * ((tip + 10)/100))*100)/100
            let maxPerPerson = (round(((input! + maximumTip)/group)*100))/100
            fivePercentTip.text = String(minimumTip)
            tenPercentTip.text = String(mediumTip)
            fifteenPercentTip.text = String(maximumTip)
            fivePercentTotal.text = String(minPerPerson)
            tenPercentTotal.text = String(medPerPerson)
            fifteenPercentTotal.text = String(maxPerPerson)
        }
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

