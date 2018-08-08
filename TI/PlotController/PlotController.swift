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

class PlotController: NSViewController
{
    @IBOutlet weak var ports: NSComboBox!
    @IBOutlet weak var baud: NSComboBox!
    @IBOutlet weak var databits: NSComboBox!
    @IBOutlet weak var parity: NSComboBox!
    @IBOutlet weak var stopbits: NSComboBox!
    @IBOutlet weak var plot: PlotView!
    @IBOutlet weak var serial: Serial!
    
    let serialPort:Serial! = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//        for port in serialPortManager.availablePorts
//        {
//            ports.addItem(withObjectValue: port.path)
//            if (port.path == "/dev/cu.SLAB_USBtoUART")
//            {
//                ports.stringValue = port.path
//                self.serialPort = port
//                self.serialPort?.baudRate = 115200
//                self.serialPort?.numberOfStopBits = 1
//                self.serialPort?.parity = ORSSerialPortParity.none
//                self.serialPort?.numberOfDataBits = 8
//                self.serialPort?.usesDTRDSRFlowControl = false
//                self.serialPort?.usesRTSCTSFlowControl = false
//                self.serialPort?.usesDCDOutputFlowControl = false
//            }
//        }
        // Do view setup here.
       // Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
    }
    
    @objc func runTimeCode()
    {
        let res = Int(randomNumber(inRange: 0...100))
        
        plot.add(point: res)
        plot.display()
    }
    
    func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
    
//    @IBAction func connect_event(_ sender: NSButton)
//    {
//        //print(self.serial)
////        if let port = self.serial.getSerial()
////        {
////            if (port.isOpen)
////            {
////                port.close()
////            }
////            else
////            {
////                port.open()
////                print(" \(port.baudRate) \(port.name)")
////                print("Serial port \(port) opened successfully.")
////                sender.title = (sender.title == "Connect") ? "Disconnect" : "Connect";
////                ports.isEnabled = (sender.title == "Connect");
////                baud.isEnabled = (sender.title == "Connect");
////                databits.isEnabled = (sender.title == "Connect");
////                parity.isEnabled = (sender.title == "Connect");
////                stopbits.isEnabled = (sender.title == "Connect");
////            }
////        }
//    }
}
