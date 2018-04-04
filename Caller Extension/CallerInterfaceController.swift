//
//  CallerInterfaceController.swift
//  Dialer App
//
//  Created by Mikhail Amshei on 8/6/15.
//  Copyright © 2015 Mikhail Amshei. All rights reserved.
//

import WatchKit
import Foundation


class CallerInterfaceController: WKInterfaceController {

    @IBOutlet var phoneNumberLabel: WKInterfaceLabel!
    var phoneNumber: String = ""
    var phoneStartedWithOne = false
    
    func updatePhoneNumber(number: Int) {
        let output = callerFunctions.updatePhoneNumber(number, phoneNumber: phoneNumber, phoneStartedWithOne: phoneStartedWithOne, phoneNumberLabel: phoneNumberLabel)
        phoneNumber = output.0
        phoneNumberLabel = output.1
        phoneStartedWithOne = output.2
    }
    
    @IBAction func onePressed() {
        updatePhoneNumber(1)
    }
    @IBAction func twoPressed() {
        updatePhoneNumber(2)
    }
    @IBAction func threePressed() {
        updatePhoneNumber(3)
    }
    @IBAction func fourPressed() {
        updatePhoneNumber(4)
    }
    @IBAction func fivePressed() {
        updatePhoneNumber(5)
    }
    @IBAction func sixPressed() {
        updatePhoneNumber(6)
    }
    @IBAction func sevenPressed() {
        updatePhoneNumber(7)
    }
    @IBAction func eightPressed() {
        updatePhoneNumber(8)
    }
    @IBAction func ninePressed() {
        updatePhoneNumber(9)
    }
    @IBAction func zeroPressed() {
        updatePhoneNumber(0)
    }
    @IBAction func deleteLastCharacterPressed() {
        let output = callerFunctions.deletePressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
        phoneNumber = output.0
        phoneNumberLabel = output.1
        phoneStartedWithOne = output.2
    }
    @IBAction func dialPressed() {
        phoneNumberLabel = callerFunctions.dialPressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        phoneNumberLabel.setTextColor(UIColor.cyanColor())
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    //push menu navigation
    @IBAction func oldTimes() {
        presentControllerWithName("oldTimesStyleController", context: nil)
    }
    @IBAction func settings() {
        presentControllerWithName("settingsController", context: nil)
    }
    
}
