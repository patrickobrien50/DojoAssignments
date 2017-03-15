//
//  ViewController.swift
//  Rainbow Road
//
//  Created by Patrick O'Brien on 3/8/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] =  [.red, .orange, .yellow, .green, .blue, .purple]
    
    @IBOutlet weak var rainbowView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rainbowView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = colors[indexPath.row]
        print("Colors")
        return cell
    }
}

