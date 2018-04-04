//
//  OldTimesInterfaceController.swift
//  Dialer App
//
//  Created by Mikhail Amshei on 8/7/15.
//  Copyright © 2015 Mikhail Amshei. All rights reserved.
//

import WatchKit
import Foundation


class OldTimesInterfaceController: WKInterfaceController {
    
    func createAndSetPickerItems(picker: WKInterfacePicker) {
        var pickerItemsArray: [WKPickerItem] = []
        for i in 0...9 {
            let pickerItem = WKPickerItem()
            pickerItem.title = "\(i)"
            pickerItemsArray.append(pickerItem)
        }
        let callItem = WKPickerItem()
        callItem.title = "Call"
        pickerItemsArray.append(callItem)
        let deleteItem = WKPickerItem()
        deleteItem.title = "⌫"
        pickerItemsArray.append(deleteItem)
        let deleteAllItem = WKPickerItem()
        deleteAllItem.title = "⚠︎"
        pickerItemsArray.append(deleteAllItem)
        
        picker.setItems(pickerItemsArray)
    }
    
    @IBOutlet var phoneNumberLabel: WKInterfaceLabel!
    var phoneNumber: String = ""
    var phoneStartedWithOne = false
    
    func showTempPhoneNumber(value: Int) {
        //setting temporary interger
        tempInt = value
        phoneNumberLabel = callerFunctions.showTempValue(value, phoneNumber: phoneNumber, phoneStartedWithOne: phoneStartedWithOne, phoneNumberLabel: phoneNumberLabel)
        lightThatValueUp(value, color: UIColor.cyanColor())
    }
    
    func updatePhoneNumber(number: Int) {
        let output = callerFunctions.updatePhoneNumber(number, phoneNumber: phoneNumber, phoneStartedWithOne: phoneStartedWithOne, phoneNumberLabel: phoneNumberLabel)
        phoneNumber = output.0
        phoneNumberLabel = output.1
        phoneStartedWithOne = output.2
        lightThatValueUp(number, color: UIColor.orangeColor())
    }
    
    //picker
    @IBOutlet var pickerOutlet: WKInterfacePicker!
    @IBOutlet var statusLabelGroup: WKInterfaceGroup!
    var tempInt: Int = 0
    @IBAction func pickerAction(value: Int) {
            switch (value) {
            case 0:
                showTempPhoneNumber(value)
            case 1:
                showTempPhoneNumber(value)
            case 2:
                showTempPhoneNumber(value)
            case 3:
                showTempPhoneNumber(value)
            case 4:
                showTempPhoneNumber(value)
            case 5:
                showTempPhoneNumber(value)
            case 6:
                showTempPhoneNumber(value)
            case 7:
                showTempPhoneNumber(value)
            case 8:
                showTempPhoneNumber(value)
            case 9:
                showTempPhoneNumber(value)
            case 10:
                tempInt = value
                phoneNumberLabel = callerFunctions.showDialPressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
            case 11:
                tempInt = value
                phoneNumberLabel = callerFunctions.showDeletePressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
            case 12:
                tempInt = value
                phoneNumberLabel = callerFunctions.showDeleteAllPressed(phoneNumber, phoneNumberLabel: phoneNumberLabel)
            default:
                break;
        }
        WKInterfaceDevice.currentDevice().playHaptic(WKHapticType.Click)
    }
    @IBAction func dialButtonPressed() {
        if tempInt < 10 {
            updatePhoneNumber(tempInt)
        } else if tempInt == 10 {
            callPressed()
        } else if tempInt == 11 {
            deletePressed()
        } else if tempInt == 12 {
            let output = callerFunctions.deleteAllPressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
            phoneNumber = output.0
            phoneNumberLabel = output.1
            phoneStartedWithOne = output.2
        } else {
            print("invalid tempInt")
        }
        //pickerOutlet.setSelectedItemIndex(0)
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
    @IBAction func fourPresed() {
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
    
    @IBAction func callPressed() {
        phoneNumberLabel = callerFunctions.dialPressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
    }
    
    @IBAction func deletePressed() {
        let output = callerFunctions.deletePressed(phoneNumber, phoneNumberLabel: phoneNumberLabel, phoneStartedWithOne: phoneStartedWithOne)
        phoneNumber = output.0
        phoneNumberLabel = output.1
        phoneStartedWithOne = output.2
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        phoneNumberLabel.setTextColor(UIColor.cyanColor())
        // Configure interface objects here.
        createAndSetPickerItems(pickerOutlet)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        phoneNumberLabel.setText(phoneNumber)
        statusLabelGroup.setBackgroundColor(UIColor.blueColor())
        
        createAndSetPickerItems(pickerOutlet)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    //push menu navigation
    @IBAction func analogueMenuItemPressed() {
        presentControllerWithName("analogueStyleController", context: nil)
    }
    @IBAction func settingsMenuItemPressed() {
        presentControllerWithName("settingsController", context: nil)
    }
    
    //animations for groups
    @IBOutlet var number0: WKInterfaceGroup!
    @IBOutlet var number1: WKInterfaceGroup!
    @IBOutlet var number2: WKInterfaceGroup!
    @IBOutlet var number3: WKInterfaceGroup!
    @IBOutlet var number4: WKInterfaceGroup!
    @IBOutlet var number5: WKInterfaceGroup!
    @IBOutlet var number6: WKInterfaceGroup!
    @IBOutlet var number7: WKInterfaceGroup!
    @IBOutlet var number8: WKInterfaceGroup!
    @IBOutlet var number9: WKInterfaceGroup!
    func lightThatValueUp(value: Int, color: UIColor) {
        if value == 0 {
            number0.setBackgroundColor(color)
            number1.setBackgroundColor(UIColor.blueColor())
        } else if value == 1 {
            number0.setBackgroundColor(UIColor.blueColor())
            number1.setBackgroundColor(color)
            number2.setBackgroundColor(UIColor.blueColor())
        } else if value == 2 {
            number1.setBackgroundColor(UIColor.blueColor())
            number2.setBackgroundColor(color)
            number3.setBackgroundColor(UIColor.blueColor())
        } else if value == 3 {
            number2.setBackgroundColor(UIColor.blueColor())
            number3.setBackgroundColor(color)
            number4.setBackgroundColor(UIColor.blueColor())
        } else if value == 4 {
            number3.setBackgroundColor(UIColor.blueColor())
            number4.setBackgroundColor(color)
            number5.setBackgroundColor(UIColor.blueColor())
        } else if value == 5 {
            number4.setBackgroundColor(UIColor.blueColor())
            number5.setBackgroundColor(color)
            number6.setBackgroundColor(UIColor.blueColor())
        } else if value == 6 {
            number5.setBackgroundColor(UIColor.blueColor())
            number6.setBackgroundColor(color)
            number7.setBackgroundColor(UIColor.blueColor())
        } else if value == 7 {
            number6.setBackgroundColor(UIColor.blueColor())
            number7.setBackgroundColor(color)
            number8.setBackgroundColor(UIColor.blueColor())
        } else if value == 8 {
            number7.setBackgroundColor(UIColor.blueColor())
            number8.setBackgroundColor(color)
            number9.setBackgroundColor(UIColor.blueColor())
        } else if value == 9 {
            number8.setBackgroundColor(UIColor.blueColor())
            number9.setBackgroundColor(color)
            
        }
    }
    
}
