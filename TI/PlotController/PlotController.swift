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
    
    func findSerialDevices(deviceType: String, serialPortIterator: inout io_iterator_t ) -> kern_return_t
    {
        var result: kern_return_t = KERN_FAILURE
        let classesToMatch = IOServiceMatching(kIOSerialBSDServiceValue)
        var classesToMatchDict = (classesToMatch as! NSDictionary)
            as! Dictionary<String, AnyObject>
        classesToMatchDict[kIOSerialBSDTypeKey] = deviceType as AnyObject
        let classesToMatchCFDictRef = (classesToMatchDict as NSDictionary) as CFDictionary
        result = IOServiceGetMatchingServices(kIOMasterPortDefault, classesToMatchCFDictRef, &serialPortIterator);
        return result
    }
    
    func printSerialPaths(portIterator: io_iterator_t)
    {
        var serialService: io_object_t
        repeat {
            serialService = IOIteratorNext(portIterator)
            if (serialService != 0) {
                let key: CFString! = "IOCalloutDevice" as CFString
                let bsdPathAsCFtring: AnyObject? =
                    IORegistryEntryCreateCFProperty(serialService, key, kCFAllocatorDefault, 0).takeUnretainedValue()
                let bsdPath = bsdPathAsCFtring as! String?
                if let path = bsdPath {
                    print(path)
                    if (path == "/dev/cu.SLAB_USBtoUART")
                    {
                        ports.stringValue = path
                    }
                    ports.addItem(withObjectValue: path)
                }
            }
        } while serialService != 0;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var portIterator: io_iterator_t = 0
        let kernResult = findSerialDevices(deviceType: kIOSerialBSDAllTypes, serialPortIterator: &portIterator)
        if kernResult == KERN_SUCCESS
        {
            printSerialPaths(portIterator: portIterator)
        }
        // Do view setup here.
        Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
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
    
    @IBAction func connect_event(_ sender: NSButton) {
        let portName = ports.stringValue;
        let serialPort: SerialPort = SerialPort(path: portName)
        
        do {
            
            print("Attempting to open port: \(portName)")
            try serialPort.openPort()
            print("Serial port \(portName) opened successfully.")
            defer {
                serialPort.closePort()
                print("Port Closed")
            }
            
            serialPort.setSettings(receiveRate: .baud115200,
                                   transmitRate: .baud115200,
                                   minimumBytesToRead: 1)
            
            print("Waiting to receive what was written...")
            
            let stringReceived = try serialPort.readString(ofLength: 10)
            
            print("Uh oh! Received string is not the same as what was transmitted. This was what we received,")
            print("<\(stringReceived)>")
            
            print("End of example");
            
            
        } catch PortError.failedToOpen {
            print("Serial port \(portName) failed to open. You might need root permissions.")
        } catch {
            print("Error: \(error)")
        sender.title = (sender.title == "Connect") ? "Disconnect" : "Connect";
        ports.isEnabled = (sender.title == "Connect");
        baud.isEnabled = (sender.title == "Connect");
        databits.isEnabled = (sender.title == "Connect");
        parity.isEnabled = (sender.title == "Connect");
        stopbits.isEnabled = (sender.title == "Connect");
    }
}
}
