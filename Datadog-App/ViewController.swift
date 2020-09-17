//
//  ViewController.swift
//  Datadog-App
//
//  Created by muhammad.awais on 7/8/20.
//  Copyright © 2020 muhammad.awais. All rights reserved.
//

import UIKit
import Datadog

var logger: Logger!

class ViewController: UIViewController {
//    labels and buttons connected
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        background code
        UIGraphicsBeginImageContext(self.view.frame.size)
           UIImage(named: "DatadogImage")?.draw(in: self.view.bounds)
           let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           self.view.backgroundColor = UIColor(patternImage: image)
//        buttons style code
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        
        button2.backgroundColor = .clear
        button2.layer.cornerRadius = 5
        button2.layer.borderWidth = 3
        button2.layer.borderColor = UIColor.black.cgColor
        
//    Datadog setup
//    First you will need to initalize the app with your client token found in your account and include the
//    environment and service name
        Datadog.initialize(
            appContext: .init(),
            configuration: Datadog.Configuration
                .builderUsing(clientToken: "pubc51c1e44835831c24e8cd738b48bba3d", environment: "datadogIosApp")
                .set(serviceName: "appname")
                .build()
        )
//    Set your info here
        Datadog.setUserInfo(id: "abcd-1234", name: "foo", email: "foo@example.com")
//    Configure the logger to send logs
        logger = Logger.builder
        .sendNetworkInfo(true)
        .set(serviceName: "IOS App")
        .sendLogsToDatadog(true)
        .printLogsToConsole(true, usingFormat: .shortWith(prefix: "[iOS App] "))
        .build()
//      Pick the log type
        Datadog.verbosityLevel = .debug
//      add attribute
        logger.addAttribute(forKey: "device-model", value: UIDevice.current.model)
//      configure the tracer to send traces
        Global.sharedTracer = DDTracer.initialize(
            configuration: DDTracer.Configuration(
                sendNetworkInfo: true
            )
        )
        
    }
    
//  This function is excuted when the "send log" button is pushed
//  This will generate a notice log that sends the message of "testing"
    @IBAction func sendLog(_ sender: UIButton) {
        print("log testing")
        logger.notice("testing?")
//   You can uncomment the code below to send an info log with the attribute listed below
//        logger.info("Clicked To Sent Log", attributes: ["context": "onboarding flow"])
        
//   This will show the label confirming the log was sent and then disappering for 2 seconds on the app
//   Please do not format the label code below to when the print statement occurs as this is to check if the
//   function occurred.
        label.isHidden = false
        self.label.text = "Log Sent!!!"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.label.isHidden = true
        }
//   Final check if the log function worked
        print("log finished")

    }
    
//   This function occurs when the "send trace" button is pressed
//   This will create a trace and span to send to Datadog
    @IBAction func sendTrace(_ sender: UIButton) {
        
        print("Trace test")
        let span = Global.sharedTracer.startSpan(operationName: "something I measured here")
        // do something you want to measure ...
        // ... then, when the operation is finished:
        span.finish()
        
//    Same process as the log label to prove if the trace was send
//   Please do not format the label code below to when the print statement occurs as this is to check if the
//   function occurred.
        label.isHidden = false
        self.label.text = "Trace Sent!!!"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.label.isHidden = true
        }
        
        print("trace finished")
    }
    
}
