//
//  ViewController.swift
//  Beasts
//
//  Created by Patrick O'Brien on 3/8/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var beasts = [String]()
    @IBOutlet weak var beastNameTextField: UITextField!
    @IBOutlet weak var beastTableView: UITableView!
    
    @IBAction func beastButtonPressed(_ sender: UIButton) {
        if beastNameTextField.text != ""{
            beasts.append(beastNameTextField.text!)
            print(beasts)
            beastTableView.reloadData()
            beastNameTextField.text = ""
        }
        else {
            let alertController = UIAlertController(title: "Invalid Entry", message:
                "Try Again", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beastTableView.dataSource = self
        beastTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = beasts[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section) and Row: \(indexPath.row)")
        beasts.remove(at: indexPath.row)
        beastTableView.reloadData()
    }
}

