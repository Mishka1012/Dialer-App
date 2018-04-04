//
//  callerFunctions.swift
//  Dialer App
//
//  Created by Mikhail Amshei on 8/7/15.
//  Copyright © 2015 Mikhail Amshei. All rights reserved.
//

import WatchKit

class callerFunctions: WKInterfaceObject {
    
    class func deletePressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel, var phoneStartedWithOne: Bool) -> (String, WKInterfaceLabel, Bool) {
        if phoneNumber.characters.count > 1 {
            phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            if phoneNumber.hasSuffix("-") {
                phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            }
            phoneNumberLabel.setTextColor(UIColor.orangeColor())
            phoneNumberLabel.setText(phoneNumber)
            WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Click)
        } else if phoneNumber.characters.count == 1 {
            phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
            phoneStartedWithOne = false
            phoneNumberLabel.setText("Dial Phone")
            phoneNumberLabel.setTextColor(UIColor.cyanColor())
            WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Retry)
        } else {
            phoneNumberLabel.setTextColor(UIColor.redColor())
            phoneNumberLabel.setText("Dial Phone Please!")
            WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Failure)
        }
        return (phoneNumber, phoneNumberLabel, phoneStartedWithOne)
    }
    
    //delete all function
    class func deleteAllPressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel, var phoneStartedWithOne: Bool) -> (String, WKInterfaceLabel, Bool) {
        if phoneNumber.characters.count > 0 {
            phoneNumber = ""
            phoneStartedWithOne = false
            phoneNumberLabel.setText("Dial Phone")
            phoneNumberLabel.setTextColor(UIColor.cyanColor())
            WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Retry)
        } else {
            phoneNumberLabel.setTextColor(UIColor.redColor())
            phoneNumberLabel.setText("Dial Phone Please!")
            WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Failure)
        }
        return (phoneNumber, phoneNumberLabel, phoneStartedWithOne)
    }
    
    class func updatePhoneNumber(number: Int, var phoneNumber: String, var phoneStartedWithOne: Bool, phoneNumberLabel: WKInterfaceLabel) -> (String, WKInterfaceLabel, Bool) {
        //logic for dashes and colors
        phoneNumberLabel.setTextColor(UIColor.yellowColor())
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
        //adding numbers now
        if phoneStartedWithOne != true {
            if phoneNumber.characters.count < 12 {
                phoneNumber = phoneNumber.stringByAppendingString("\(number)")
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Click)
            } else {
                phoneNumberLabel.setTextColor(UIColor.redColor())
            WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Failure)
            }
        } else {
            if phoneNumber.characters.count < 14 {
                phoneNumber = phoneNumber.stringByAppendingString("\(number)")
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Click)
            } else {
                phoneNumberLabel.setTextColor(UIColor.redColor())
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Failure)
            }
        }
        //showing whatever is there
        phoneNumberLabel.setText(phoneNumber)
        return (phoneNumber, phoneNumberLabel, phoneStartedWithOne)
    }
    
    class func dialPressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel, phoneStartedWithOne: Bool) -> WKInterfaceLabel {
        
        if phoneStartedWithOne {
            if phoneNumber.characters.count == 14 {
                let phoneNumberArray = phoneNumber.componentsSeparatedByString("-")
                var phoneToCall = "tel:"
                for i in 1...phoneNumberArray.count {
                    phoneToCall = phoneToCall.stringByAppendingString(phoneNumberArray[i-1])
                }
                WKExtension.sharedExtension().openSystemURL(NSURL(string: phoneToCall)!)
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Success)
            } else {
                phoneNumberLabel.setTextColor(UIColor.redColor())
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Stop)
            }
        } else {
            if phoneNumber.characters.count == 12 {
                let phoneNumberArray = phoneNumber.componentsSeparatedByString("-")
                var phoneToCall = "tel:"
                for i in 1...phoneNumberArray.count {
                    phoneToCall = phoneToCall.stringByAppendingString(phoneNumberArray[i-1])
                }
                WKExtension.sharedExtension().openSystemURL(NSURL(string: phoneToCall)!)
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Success)
            } else {
                phoneNumberLabel.setTextColor(UIColor.redColor())
                WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Stop)
            }
        }
        return phoneNumberLabel
    }
    //show dialpressed
    class func showDialPressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel, phoneStartedWithOne: Bool) -> WKInterfaceLabel {
        
        if phoneStartedWithOne {
            if phoneNumber.characters.count == 14 {
                let phoneNumberArray = phoneNumber.componentsSeparatedByString("-")
                var phoneToCall = "tel:"
                for i in 1...phoneNumberArray.count {
                    phoneToCall = phoneToCall.stringByAppendingString(phoneNumberArray[i-1])
                }
                print("Calling: " + phoneToCall)
            } else {
                phoneNumberLabel.setText(phoneNumber)
                phoneNumberLabel.setTextColor(UIColor.redColor())
            }
        } else {
            if phoneNumber.characters.count == 12 {
                let phoneNumberArray = phoneNumber.componentsSeparatedByString("-")
                var phoneToCall = "tel:"
                for i in 1...phoneNumberArray.count {
                    phoneToCall = phoneToCall.stringByAppendingString(phoneNumberArray[i-1])
                }
                print("Calling: " + phoneToCall)
            } else {
                phoneNumberLabel.setText(phoneNumber)
                phoneNumberLabel.setTextColor(UIColor.redColor())
            }
        }
        return phoneNumberLabel
    }

    
    //function to show value
    class func showTempValue(number: Int, var phoneNumber: String, var phoneStartedWithOne: Bool, phoneNumberLabel: WKInterfaceLabel) -> WKInterfaceLabel {
        //logic for dashes and colors
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
            }
        } else if phoneNumber.characters.count == 13 {
            if phoneStartedWithOne == true {
            }
        }
        //adding numbers now
        if phoneStartedWithOne != true {
            if phoneNumber.characters.count < 12 {
                phoneNumber = phoneNumber.stringByAppendingString("\(number)")
            } else {
            }
        } else {
            if phoneNumber.characters.count < 14 {
                phoneNumber = phoneNumber.stringByAppendingString("\(number)")
            } else {
            }
        }
        //showing whatever is there
        phoneNumberLabel.setText(phoneNumber)
        phoneNumberLabel.setTextColor(UIColor.cyanColor())
        return phoneNumberLabel
    }
    //showing delete is pressed
    class func showDeletePressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel, var phoneStartedWithOne: Bool) -> WKInterfaceLabel {
        
        if phoneNumber.characters.count > 1 {
            phoneNumber = phoneNumber.stringByPaddingToLength(phoneNumber.characters.count-1, withString: "", startingAtIndex: 0)
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
            phoneNumberLabel.setTextColor(UIColor.redColor())
            phoneNumberLabel.setText("Dial Phone Please!")
        }
        return phoneNumberLabel
    }
    
    //show delete all function
    class func showDeleteAllPressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel) -> WKInterfaceLabel {
        if phoneNumber.characters.count > 0 {
            phoneNumberLabel.setText("Dial Phone")
            phoneNumberLabel.setTextColor(UIColor.cyanColor())
        } else {
            phoneNumberLabel.setTextColor(UIColor.redColor())
            phoneNumberLabel.setText("Dial Phone Please!")
        }
        return phoneNumberLabel
    }
}
