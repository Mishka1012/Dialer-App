//: Playground - noun: a place where people can play

import WatchKit
import Foundation

func deletePressed(var phoneNumber: String, phoneNumberLabel: WKInterfaceLabel, var phoneStartedWithOne: Bool) -> WKInterfaceLabel {
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