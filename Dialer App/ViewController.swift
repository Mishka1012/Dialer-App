//
//  ViewController.swift
//  Dialer App
//
//  Created by Mikhail Amshei on 8/5/15.
//  Copyright (c) 2015 Mikhail Amshei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumberLabel.text = "Waiting for input to dial."
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("dialNumber:"), name: "phoneNotification"/*has to be the same name as in delegate*/, object: nil)
    }
    //function for dialing number
    func dialNumber(notificationMessage: NSNotification) {
        let number = notificationMessage.object as? String
        phoneNumberLabel.text = "Dialing \(number!)"
        //how to dial a number
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

