//
//  ConfigController.swift
//  TI
//
//  Created by Ilya Mordasov on 03/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

let labels:Array<String> = ["CONFIG1", "CONFIG2", "CONFIG3", "LOFF", "CH1SET", "CH2SET", "CH3SET", "CH4SET", "CH5SET", "CH6SET", "CH7SET", "CH8SET", "RLD_SENSP", "RLD_SENSN", "LOFF_SENSP", "LOFF_SENSN", "LOFF_FLIP" , "GPIO", "PACE", "RESP", "CONFIG4", "WCT1", "WCT2"];
let addr:Array<UInt8> = [0x01, 0x02, 0x03, 0x17, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x18, 0x19]
let configs = [
    [[1, 0, 0, 0, 0, 1, 1, 0],[true, true, true, false, false, true, true, true], [true]], //CONFIG1
    [[0, 0, 0, 1, 0, 1, 0, 0],[false, false, true, true, false, true, true, true], [true]], //CONFIG2
    [[1, 1, 0, 0, 1, 1, 1, 0],[true, false, true, true, true, true, true, true], [true]], //CONFIG3
    [[0, 0, 0, 0, 0, 0, 1, 0],[true, true, true, true, true, true, true, true], [true]], //LOFF
    [[0, 1, 1, 0, 0, 0, 0, 0],[true, true, true, true, false, true, true, true], [true]], //CH1SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH2SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH3SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH4SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH5SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH6SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH7SET
    [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH8SET
    [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //RLD_SENSP
    [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //RLD_SENSN
    [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //LOFF_SENSP
    [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //LOFF_SENSN
    [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]], //LOFF_FLIP
    [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]], //GPIO
    [[0, 0, 0, 0, 0, 0, 0, 0],[false, false, false, true, true, true, true, true], [false]], //PACE
    [[0, 0, 1, 0, 0, 0, 0, 0],[true, true, false, true, true, true, true, true], [false]], //RESP
    [[1, 1, 1, 0, 1, 1, 1, 0],[true, true, true, false, true, true, true, false], [false]], //CONFIG4
    [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]], //WCT1
    [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]] //WCT2
]

class ConfigController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
        
        tableView.delegate = self as! NSTableViewDelegate
        tableView.dataSource = self as! NSTableViewDataSource
        tableView.target = self
        tableView.reloadData()
    }
    
    @objc func checkBoxClicked(_ sender:NSButton)
    {
        let cell = (sender.superview as! NSTableRowView)
        let row:Int = cell.value(forKey: "row") as! Int
        var a:Int = 0
        print("col \(cell) row \(row)")
        for i in 0...7
        {
            let view = tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 3+i) as! NSButton
            a += view.state.rawValue << (7-i)
        }
        let value = tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 2) as! NSTextField
        value.stringValue = String(format:"0x%02X", a)
    }
}

extension ConfigController: NSTableViewDataSource
{
    func numberOfRows(in tableView: NSTableView) -> Int
    {
        return labels.count
    }
}

extension ConfigController: NSTableViewDelegate
{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?
    {
        let name:String = tableColumn?.identifier.rawValue as! String
        var column:Int = Int(name.components(separatedBy: ".")[1])!

        var view:(Any)? = nil
        
        switch tableColumn
        {
            case tableView.tableColumns[0]:
                view = NSTextField(string: labels[row])
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                return (view as! NSView)
            
            case tableView.tableColumns[1]:
                view = NSTextField(string: String(format:"0x%02X", addr[row]))
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                return (view as! NSView)
            
            case tableView.tableColumns[3], tableView.tableColumns[4], tableView.tableColumns[5], tableView.tableColumns[6], tableView.tableColumns[7], tableView.tableColumns[8], tableView.tableColumns[9], tableView.tableColumns[10]:
                view = NSButton()
                (view as! NSButton).setButtonType(NSButton.ButtonType.switch)
                (view as! NSButton).title = ""
                (view as! NSButton).isEnabled = configs[row][1][column-3] as! Bool
                (view as! NSButton).state = ((configs[row][0][column-3] as! Int) == 1) ? NSControl.StateValue.on : NSControl.StateValue.off;
                (view as! NSButton).action = #selector(checkBoxClicked(_:))
                return (view as! NSView)
            
            case tableView.tableColumns[11]:
                view = ITSwitch()
                (view as! ITSwitch).setBoundsSize(NSSize(width: 32, height: 20))
                (view as! ITSwitch).sizeToFit()
                //(view as! ITSwitch).frame.size.height = 20
                (view as! ITSwitch).checked = configs[row][2][0] as! Bool
                return (view as! NSView)
            
            case tableView.tableColumns[2]:
                var a:Int = 0
                var i:Int = 0
                for bit:Int in configs[row][0] as! Array<Int>
                {
                    a += bit << (7-i)
                    i += 1
                }
                
                view = NSTextField()
                (view as! NSTextField).stringValue = String(format:"0x%02X", a)
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                return (view as! NSView)
            
            case .none: break
            case .some(_): break
            
        }
        return nil
        
    }
}
