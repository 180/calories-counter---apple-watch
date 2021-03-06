//
//  InterfaceController.swift
//  CaloriesCounter WatchKit Extension
//
//  Created by Maciej Stanik on 25/07/2015.
//  Copyright (c) 2015 Maciej Stanik. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    
    var calories = 100
    var caloriesTotal = 0
    
    @IBOutlet weak var totalCaloriesLabel: WKInterfaceLabel!
    @IBOutlet weak var caloriesLabel: WKInterfaceLabel!
    @IBOutlet weak var slider: WKInterfaceSlider!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let calories = defaults.integerForKey("caloriesTotal")
        
        if calories > 0 {
            caloriesTotal = calories
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        totalCaloriesLabel.setText("\(caloriesTotal) CAL")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
    @IBAction func addButtonTapped() {
        caloriesTotal = caloriesTotal + calories
        calories = 100
        updateScreen()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(caloriesTotal, forKey: "caloriesTotal")
    }
    
    @IBAction func sliderValueChanged(value: Float) {
        calories = Int(value)
        
        updateScreen()
    }
    
    func updateScreen() {
        caloriesLabel.setText("\(calories) CAL")
        totalCaloriesLabel.setText("\(caloriesTotal) CAL")
        slider.setValue(Float(calories))
    }
    
}