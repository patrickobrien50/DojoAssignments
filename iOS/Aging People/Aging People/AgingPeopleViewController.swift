//
//  ViewController.swift
//  Aging People
//
//  Created by Patrick O'Brien on 3/9/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

class AgingPeopleViewController: UITableViewController {
    let people = ["Patrick", "Basila", "Elysia", "Arnold", "Amy", "Jaxon", "Randy", "Lana", "Jeff", "Shadow", "Zoe", "Anna"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var ageLabel: UILabel!
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = self.people[indexPath.row]
        
        let age = arc4random_uniform(95 - 5) + 4
        cell.detailTextLabel?.text = "\(age) years old"
        return cell
    }

}

