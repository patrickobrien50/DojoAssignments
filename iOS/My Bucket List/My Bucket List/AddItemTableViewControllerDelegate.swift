//
//  AddItemTableViewControllerDelegate.swift
//  My Bucket List
//
//  Created by Patrick O'Brien on 3/9/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import UIKit

protocol AddItemTableViewControllerDelegate: class {
    func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?)
    func cancelButtonPressed(by controller: AddItemTableViewController)
}
