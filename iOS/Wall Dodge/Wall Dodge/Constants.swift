//
//  Constants.swift
//  Wall Dodge
//
//  Created by Patrick O'Brien on 3/10/17.
//  Copyright © 2017 Patrick O'Brien. All rights reserved.
//

import Foundation
import UIKit

// Configuration
let kMLGroundHeight: CGFloat = 20.0

// Initial Variables
let kDefaultXToMovePerSecond: CGFloat = 320.0

// Collision Detection
let heroCategory: UInt32 = 0x1 << 0
let wallCategory: UInt32 = 0x1 << 1
