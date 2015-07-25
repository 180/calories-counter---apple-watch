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
        
        caloriesLeftLabel.setText("2700")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let calories = defaults.integerForKey("caloriesTotal")
        let caloriesLeft = 2700 - calories
        
        if calories > 0 {
            caloriesLeftLabel.setText("\(caloriesLeft)")
        }
        
        if (caloriesLeft < 0) {
            caloriesLeftLabel.setText("0")
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
