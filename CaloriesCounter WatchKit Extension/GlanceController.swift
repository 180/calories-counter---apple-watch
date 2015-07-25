//
//  GlanceController.swift
//  CaloriesCounter
//
//  Created by Maciej Stanik on 25/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    @IBOutlet weak var caloriesLeftLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let calories = defaults.integerForKey("caloriesTotal")
        
        if calories > 0 {
            caloriesLeftLabel.setText("\(2700 - calories)")
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
