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
    
    var n:Int = 0;
    let ecg = ECG_DataSet()
    var timer:Timer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
        NotificationCenter.default.addObserver(self, selector: #selector(self.newUARTDataIsReady), name: NSNotification.Name(rawValue: "newUARTDataIsReady"), object: nil)
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
    
    
    @IBAction func scale_event(_ sender: NSButton)
    {
        plot.scaled(value: (sender.state.rawValue == 1) ? true : false)
    }
    
    @IBAction func testECG_event(_ sender: NSButton)
    {
        if sender.title == "Test ECG"
        {
            sender.title = "Stop ECG"
            timer = Timer.scheduledTimer(timeInterval: 1/115200, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
        }
        else
        {
            sender.title = "Test ECG"
            n = 0
            plot.removeData()
            timer.invalidate()
        }
    }
    
    @objc func runTimeCode()
    {
        let data:Int = self.ecg.ecg_dataset[n]
        plot.add(point: data)
        plot.display()
        
        n += 1
        if n >= self.ecg.ecg_dataset.count
        {
            n = 0
        }
    }
}
