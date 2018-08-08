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
        // Do view setup here.
       Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
    }
    
    @objc func runTimeCode()
    {
        let res = Int(randomNumber(inRange: -100...100))
        
        plot.add(point: res)
        plot.display()
    }
    
    func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }
}
