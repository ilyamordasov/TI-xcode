//
//  Serial.swift
//  TI
//
//  Created by Ilya Mordasov on 08/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa
import ORSSerial

class Serial: NSObject, ORSSerialPortDelegate, NSUserNotificationCenterDelegate
{
    @IBOutlet weak var openCloseButton: NSButton!
    
    @objc let serialPortManager = ORSSerialPortManager.shared()
    @objc let availableBaudRates = [300, 1200, 2400, 4800, 9600, 14400, 19200, 28800, 38400, 57600, 115200, 230400]
    @objc let availableParity = ["None", "Odd", "Even"]
    @objc let availableNumberOfStopBits = [1, 2]
    @objc dynamic var shouldAddLineEnding = false
    
    @objc dynamic var serialPort: ORSSerialPort?
    {
        didSet
        {
            oldValue?.close()
            oldValue?.delegate = nil
            serialPort?.delegate = self
        }
    }
    
    override init()
    {
        super.init()
        
        self.serialPort?.baudRate = 115200
        self.serialPort?.numberOfStopBits = 1
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(serialPortsWereConnected(_:)), name: NSNotification.Name.ORSSerialPortsWereConnected, object: nil)
        nc.addObserver(self, selector: #selector(serialPortsWereDisconnected(_:)), name: NSNotification.Name.ORSSerialPortsWereDisconnected, object: nil)
        
        NSUserNotificationCenter.default.delegate = self
        print(serialPortManager.availablePorts)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
    
    @IBAction func connect(_ sender: NSButton)
    {
        if let port = self.serialPort
        {
            if (port.isOpen)
            {
                port.close()
            }
            else
            {
                port.open()
                print(" \(port.baudRate) \(port.name)")
                print("Serial port \(port) opened successfully.")
            }
        }
    }
    
    // MARK: - ORSSerialPortDelegate
    
    func serialPortWasOpened(_ serialPort: ORSSerialPort) {
        self.openCloseButton.title = "Disconnect"
    }
    
    func serialPortWasClosed(_ serialPort: ORSSerialPort) {
        self.openCloseButton.title = "Connect"
    }
    
    func serialPort(_ serialPort: ORSSerialPort, didReceive data: Data) {
        if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
            let num = Int(Float((string.components(separatedBy: "\r\n")[5]).components(separatedBy: "\t\t")[1])!)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newUARTDataIsReady"), object: nil, userInfo: ["data": num ])
        }
    }
    
    func serialPortWasRemoved(fromSystem serialPort: ORSSerialPort) {
        self.serialPort = nil
        self.openCloseButton.title = "Connect"
    }
    
    func serialPort(_ serialPort: ORSSerialPort, didEncounterError error: Error) {
        print("SerialPort \(serialPort) encountered an error: \(error)")
    }
    
    // MARK: - NSUserNotifcationCenterDelegate
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, didDeliver notification: NSUserNotification) {
        let popTime = DispatchTime.now() + Double(Int64(3.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: popTime) { () -> Void in
            center.removeDeliveredNotification(notification)
        }
    }
    
    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    
    // MARK: - Notifications
    
    @objc func serialPortsWereConnected(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let connectedPorts = userInfo[ORSConnectedSerialPortsKey] as! [ORSSerialPort]
            print("Ports were connected: \(connectedPorts)")
            self.postUserNotificationForConnectedPorts(connectedPorts)
        }
    }
    
    @objc func serialPortsWereDisconnected(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            let disconnectedPorts: [ORSSerialPort] = userInfo[ORSDisconnectedSerialPortsKey] as! [ORSSerialPort]
            print("Ports were disconnected: \(disconnectedPorts)")
            self.postUserNotificationForDisconnectedPorts(disconnectedPorts)
        }
    }
    
    func postUserNotificationForConnectedPorts(_ connectedPorts: [ORSSerialPort]) {
        let unc = NSUserNotificationCenter.default
        for port in connectedPorts {
            let userNote = NSUserNotification()
            userNote.title = NSLocalizedString("Serial Port Connected", comment: "Serial Port Connected")
            userNote.informativeText = "Serial Port \(port.name) was connected to your Mac."
            userNote.soundName = nil;
            unc.deliver(userNote)
        }
    }
    
    func postUserNotificationForDisconnectedPorts(_ disconnectedPorts: [ORSSerialPort]) {
        let unc = NSUserNotificationCenter.default
        for port in disconnectedPorts {
            let userNote = NSUserNotification()
            userNote.title = NSLocalizedString("Serial Port Disconnected", comment: "Serial Port Disconnected")
            userNote.informativeText = "Serial Port \(port.name) was disconnected from your Mac."
            userNote.soundName = nil;
            unc.deliver(userNote)
        }
    }
    
}
