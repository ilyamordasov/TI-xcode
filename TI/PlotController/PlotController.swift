//
//  PlotController.swift
//  TI
//
//  Created by Ilya Mordasov on 03/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa
import IOKit
import IOKit.serial
import Foundation

class PlotController: NSViewController, NSUserNotificationCenterDelegate
{
    @IBOutlet weak var plot: PlotView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
        NotificationCenter.default.addObserver(self, selector: #selector(self.newUARTDataIsReady), name: NSNotification.Name(rawValue: "newUARTDataIsReady"), object: nil)

       //Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
    }
    
    @objc func newUARTDataIsReady(notif: NSNotification)
    {
        //Insert code here
        if let data = notif.userInfo!["data"] as? NSNumber
        {
            plot.add(point: Int(truncating: data))
            plot.display()
        }
    }
    
    @objc func runTimeCode()
    {
        
        
        //plot.add(point: res)
        //plot.display()
    }
}
