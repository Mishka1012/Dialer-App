//
//  InterfaceController.swift
//  Dialer App WatchKit Extension
//
//  Created by Mikhail Amshei on 8/5/15.
//  Copyright (c) 2015 Mikhail Amshei. All rights reserved.
//

import WatchKit
import Foundation
import UIKit


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var phoneNumberLabel: WKInterfaceLabel!
    var phoneNumber: String = ""
    var phoneStartedWithOne = false
    //function to update phone number
    func updatePhoneNumber(number: String)  {
        //setting color for in process
        phoneNumberLabel.setTextColor(UIColor.yellowColor())
        //logic for dashes and some colors
        if phoneNumber.characters.count == 1 {
            if phoneNumber == "1" {
                phoneNumber = phoneNumber.stringByAppendingString("-")
                phoneStartedWithOne = true
            } else {
                phoneStartedWithOne = false
            }
        } else if phoneNumber.characters.count == 3 {
            if phoneStartedWithOne != true {
                phoneNumber = phoneNumber.stringByAppendingString("-")
            }
        } else if phoneNumber.characters.count == 5 {
            if phoneStartedWithOne == true {
                phoneNumber = phoneNumber.stringByAppendingString("-")
            }
        } else if phoneNumber.characters.count == 7 {
            if phoneStartedWithOne != true {
                phoneNumber = phoneNumber.stringByAppendingString("-")
            }
        } else if phoneNumber.characters.count == 9 {
            if phoneStartedWithOne == true {
                phoneNumber = phoneNumber.stringByAppendingString("-")
            }
        } else if phoneNumber.characters.count == 11 {
            if phoneStartedWithOne != true {
                phoneNumberLabel.setTextColor(UIColor.greenColor())
            }
        } else if phoneNumber.characters.count == 13 {
            if phoneStartedWithOne == true {
                phoneNumberLabel.setTextColor(UIColor.greenColor())
            }
        }
        //adding numbers
        if phoneStartedWithOne != true {
            if phoneNumber.characters.count < 12 {
                phoneNumber = phoneNumber.stringByAppendingString(number)
            } else {
                phoneNumberLabel.setTextColor(UIColor.greenColor())
            }
        } else {
            if phoneNumber.characters.count < 14 {
                phoneNumber = phoneNumber.stringByAppendingString(number)
            } else {
                phoneNumberLabel.setTextColor(UIColor.greenColor())
            }
        }
        //showing numbers
        phoneNumberLabel.setText(phoneNumber)
    }
    //ibactions
    @IBAction func onePressed() {
        updatePhoneNumber("1")
    }
    @IBAction func twoPressed() {
        updatePhoneNumber("2")
    }
    @IBAction func threePressed() {
        updatePhoneNumber("3")
    }
    @IBAction func fourPressed() {
        updatePhoneNumber("4")
    }
    @IBAction func fivePressed() {
        updatePhoneNumber("5")
    }
    @IBAction func sixPressed() {
        updatePhoneNumber("6")
    }
    @IBAction func sevenPressed() {
        updatePhoneNumber("7")
    }
    @IBAction func eightPressed() {
        updatePhoneNumber("8")
    }
    @IBAction func ninePressed() {
        updatePhoneNumber("9")
    }
    @IBAction func zeroPressed() {
        updatePhoneNumber("0")
    }
    @IBAction func clearPressed() {
        if phoneNumber.characters.count > 1 {
            
            if phoneNumber.hasSuffix("-") {
                phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            } else {
                phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            }
            if phoneNumber.hasSuffix("-") {
                phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            }
            phoneNumberLabel.setTextColor(UIColor.orangeColor())
            phoneNumberLabel.setText(phoneNumber)
        } else if phoneNumber.characters.count == 1 {
            phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            phoneStartedWithOne = false
            phoneNumberLabel.setText("Dial Phone")
            phoneNumberLabel.setTextColor(UIColor.cyanColor())
        } else {
            phoneNumberLabel.setText("Dial Phone Please!")
            phoneNumberLabel.setTextColor(UIColor.redColor())
        }
    }
    //function for dialing phone
    @IBAction func dialPressed() {
        var phoneToCall = ""
        if phoneStartedWithOne {
            if phoneNumber.characters.count == 14 {
                //remove dashes
                var phoneNumberArray = phoneNumber.componentsSeparatedByString("-")
                for i in 0...phoneNumberArray.count-1 {
                    phoneToCall = phoneToCall.stringByAppendingString(phoneNumberArray[i])
                }
                //let numberToDial = ["numberToDial":phoneToCall]
                //WKInterfaceController.openParentApplication(numberToDial, reply: nil)
                //NSURLSession.openURL(NSURL(string: "tel:\(phoneToCall)")!)
            } else {
                phoneNumberLabel.setTextColor(UIColor.redColor())
            }
        } else {
            if phoneNumber.characters.count == 12 {
                //removedashes
                var phoneNumberArray = phoneNumber.componentsSeparatedByString("-")
                for i in 0...phoneNumberArray.count-1 {
                    phoneToCall = phoneToCall.stringByAppendingString(phoneNumberArray[i])
                }
                /*
                if let telURL=NSURL(string:"tel:5553478") {
                    let wkExtension=WKExtension.sharedExtension()
                    wkExtension.openSystemURL(telURL)
                }
                */
                //let numberToDial = ["numberToDial":phoneToCall]
                //WKInterfaceController.openParentApplication(numberToDial, reply: nil)
            } else {
                phoneNumberLabel.setTextColor(UIColor.redColor())
            }
        }
    }
    
    //standard functions
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        phoneNumberLabel.setTextColor(UIColor.cyanColor())
        
    }

    override func willActivate() {
        
        super.willActivate()
    }

    override func didDeactivate() {
        
        super.didDeactivate()
    }

}
