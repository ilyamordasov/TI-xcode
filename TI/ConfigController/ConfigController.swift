//
//  ConfigController.swift
//  TI
//
//  Created by Ilya Mordasov on 03/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

class ConfigController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    let configs = ADS1298_Configs()
    var packNumber:Int = 0
    
    let path = Bundle.main.path(forResource: "description", ofType: "json")
    var data:Data?
    var jsonResult:[String:AnyObject] = [:]
    
    func parseJson(row:Int, value:Int) -> String
    {
        var args:NSArray = []
        var desc:String = ""
        switch row
        {
        case 0: //CONFIG1
            args = [((value & 128 == 0) ? "DR_LP" : "DR_HR"), "DAISY_EN", "CLK_EN"]
            break
        case 1: //CONFIG2
            args = ["WCT_CHOP", "INT_TEST", "TEST_AMP", "TEST_FREQ"]
            break
        case 2: //CONFIG3
            args = ["PD_REFBUF", "VREF_4V", "RLD_MEAS", "RLDREF_INT", "PD_RLD", "RLD_LOFF_SENS", "RLD_STAT"]
            break
        case 3: //LOFF
            args = ["COMP_TH", "VLEAD_OFF_EN", "ILEAD_OFF", "FLEAD_OFF"]
            break
        case 4, 5, 6, 7, 8, 9, 10, 11: //CHnSET
            args = ["PDn", "GAINn", "MUXn"]
            break
        case 12: //RLD_SENSP
            args = ["RLD8P", "RLD7P", "RLD6P", "RLD5P", "RLD4P", "RLD3P", "RLD2P", "RLD1P"]
            break
        case 13: //RLD_SENSN
            args = ["RLD8N", "RLD7N", "RLD6N", "RLD5N", "RLD4N", "RLD3N", "RLD2N", "RLD1N"]
            break
        case 14: //LOFF_SENSP
            args = ["LOFF8P", "LOFF7P", "LOFF6P", "LOFF5P", "LOFF4P", "LOFF3P", "LOFF2P", "LOFF1P"]
            break
        case 15: //LOFF_SENSN
            args = ["LOFF8N", "LOFF7N", "LOFF6N", "LOFF5N", "LOFF4P", "LOFF3N", "LOFF2N", "LOFF1N"]
            break
        case 16: //LOFF_FLIP
            args = ["LOFF_FLIP8", "LOFF_FLIP7", "LOFF_FLIP6", "LOFF_FLIP5", "LOFF_FLIP4", "LOFF_FLIP3", "LOFF_FLIP2", "LOFF_FLIP1"]
            break
        case 18: //PACE
            args = ["PACEE", "PACEO", "PD_PACE"]
            break
        case 21: //WCT1
            args = ["aVF_CH6", "aVF_CH5", "aVF_CH7", "aVF_CH4", "PD_WCTA", "WCTA"]
            break
        case 22: //WCT2
            args = ["PD_WCTC", "PD_WCTB", "WCTB", "WCTC"]
            break
        default: break
        }
        for item in args
        {
            let count = (self.jsonResult[(item as! String)] as! NSArray).count
            let val = (self.jsonResult[(item as! String)] as! NSObject).value(forKey: "value") as! NSArray
            let text = (self.jsonResult[(item as! String)] as! NSObject).value(forKey: "text") as! NSArray
            let mask = ((self.jsonResult[(item as! String)] as! NSObject).value(forKey: "mask") as! NSArray)[0] as! Int
            for i in 0..<count
            {
                if value & mask == (val[i] as! Int)
                {
                    desc += "\(text[i] as! String).\r\n"
                }
            }
        }
        return desc
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
        
        self.tableView.delegate = self as NSTableViewDelegate
        self.tableView.dataSource = self as NSTableViewDataSource
        self.tableView.target = self
        self.tableView.reloadData()
        
        do
        {
            self.data = try Data(contentsOf: URL(fileURLWithPath: self.path!), options: .mappedIfSafe)
            self.jsonResult = try JSONSerialization.jsonObject(with: self.data!, options: .mutableLeaves) as! [String:AnyObject]
        }
        catch {}
    }
    
    
    @IBAction func resetClicked(_ sender: NSButton)
    {
        let rows:Int = self.tableView.numberOfRows
        for row in 0...rows-1
        {
            var a:Int = 0
            for column in 0...7
            {
                let view = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 3+column) as! NSButton
                view.isEnabled = self.configs.configs[row][1][column] as! Bool
                view.state = ((self.configs.configs[row][0][column] as! Int) == 1) ? NSControl.StateValue.on : NSControl.StateValue.off;
                a += view.state.rawValue << (7-column)
            }
            let value = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 2) as! NSTextField
            value.stringValue = String(format:"0x%02X", a)
        }
    }
    
    
    @IBAction func applyClicked(_ sender: NSButton)
    {
        let rows:Int = self.tableView.numberOfRows
        var data:[UInt8] = []
        data.append(UInt8(0x55))
        data.append(UInt8(self.packNumber))
        //packet.append(Data(self.packNumber))
        for row in 0...rows-1
        {
            if (self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 11) as! ITSwitch).checked
            {
                let addr:String = (self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 1) as! NSTextField).stringValue.replacingOccurrences(of: "0x", with: "")
                let value:String = (self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 2) as! NSTextField).stringValue.replacingOccurrences(of: "0x", with: "")
                data.append(UInt8(addr, radix: 16)!)
                data.append(UInt8(value, radix: 16)!)
            }
        }
        data.append(UInt8(0x66))
//        data.append(UInt8(0x00))
        data.append(UInt8(13))
        data.append(UInt8(10))
        let packet:NSData = NSData(bytes: data, length: data.count)
        self.packNumber += 1
        if self.packNumber == 256
        {
            self.packNumber = 0
        }

        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newUARTDataToSend"), object: nil, userInfo: ["data": packet ])
    }
    
    @objc func switchClicked(_ sender:ITSwitch)
    {
        let cell = (sender.superview as! NSTableRowView)
        let row:Int = cell.value(forKey: "row") as! Int
        let value = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 2) as! NSTextField
        let desc = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 12) as! NSTextView
        let enabled = (self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 11) as! ITSwitch).checked
        if enabled
        {
            //value.stringValue = value.stringValue
            desc.toolTip = parseJson(row: row, value: Int(value.stringValue.replacingOccurrences(of: "0x", with: ""), radix:16)!)
            desc.string = (desc.toolTip?.replacingOccurrences(of: "\r\n", with: " "))!
        }
        else
        {
            desc.string = ""
            desc.toolTip = ""
        }
        
    }
    
    @objc func checkBoxClicked(_ sender:NSButton)
    {
        let cell = (sender.superview as! NSTableRowView)
        let row:Int = cell.value(forKey: "row") as! Int
        var a:Int = 0
        print("col \(cell) row \(row)")
        for i in 0...7
        {
            let view = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 3+i) as! NSButton
            a += view.state.rawValue << (7-i)
        }
        let value = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 2) as! NSTextField
        value.stringValue = String(format:"0x%02X", a)
        
        if row == 0
        {
            print(cell)
            
            let view = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 10) as! NSButton
            if (a & 6) == 6
            {
                view.isEnabled = false;
                view.state = NSControl.StateValue.off
            }
            else
            {
                view.isEnabled = true;
            }
        }
        
        let desc = self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 12) as! NSTextView
        let enabled = (self.tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 11) as! ITSwitch).checked
        
        if enabled
        {
            value.stringValue = String(format:"0x%02X", a)
            desc.toolTip = parseJson(row: row, value: a)
            desc.string = (desc.toolTip?.replacingOccurrences(of: "\r\n", with: " "))!
        }
    }
}

extension ConfigController: NSTableViewDataSource
{
    func numberOfRows(in tableView: NSTableView) -> Int
    {
        return self.configs.labels.count
    }
}

extension String
{
    var hexa2Bytes: [UInt8]
    {
        let hexa = Array(self)
        return stride(from: 0, to: count, by: 2).compactMap { UInt8(String(hexa[$0..<$0.advanced(by: 2)]), radix: 16) }
    }
}

extension ConfigController: NSTableViewDelegate
{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?
    {
        let name:String = tableColumn!.identifier.rawValue 
        let column:Int = Int(name.components(separatedBy: ".")[1])!

        var view:(Any)? = nil
        
        switch tableColumn
        {
            case tableView.tableColumns[0]:
                view = NSTextField(string: self.configs.labels[row])
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                return (view as! NSView)
            
            case tableView.tableColumns[1]:
                view = NSTextField(string: String(format:"0x%02X", self.configs.addr[row]))
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                return (view as! NSView)
            
            case tableView.tableColumns[3], tableView.tableColumns[4], tableView.tableColumns[5], tableView.tableColumns[6], tableView.tableColumns[7], tableView.tableColumns[8], tableView.tableColumns[9], tableView.tableColumns[10]:
                view = NSButton()
                (view as! NSButton).setButtonType(NSButton.ButtonType.switch)
                (view as! NSButton).title = ""
                (view as! NSButton).isEnabled = self.configs.configs[row][1][column-3] as! Bool
                (view as! NSButton).state = ((self.configs.configs[row][0][column-3] as! Int) == 1) ? NSControl.StateValue.on : NSControl.StateValue.off;
                (view as! NSButton).action = #selector(checkBoxClicked(_:))
                return (view as! NSView)
            
            case tableView.tableColumns[11]:
                view = ITSwitch()
                (view as! ITSwitch).setBoundsSize(NSSize(width: 32, height: 20))
                (view as! ITSwitch).sizeToFit()
                //(view as! ITSwitch).frame.size.height = 20
                (view as! ITSwitch).checked = self.configs.configs[row][2][0] as! Bool
                return (view as! NSView)
            
            case tableView.tableColumns[2]:
                var a:Int = 0
                var i:Int = 0
                for bit:Int in self.configs.configs[row][0] as! Array<Int>
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
            
            case tableView.tableColumns[12]:
                view = NSTextView()
                
                (view as! NSTextView).alignment = .left
                (view as! NSTextView).isEditable = false
                (view as! NSTextView).isSelectable = false
                (view as! NSTextView).backgroundColor = .clear
                
                (view as! NSTextView).textColor = NSColor.lightGray
                (view as! NSTextView).font = NSFont.systemFont(ofSize: 13.0)
                
                if self.configs.configs[row][2][0] as! Bool == true
                {
                    var a:Int = 0
                    var i:Int = 0
                    for bit:Int in self.configs.configs[row][0] as! Array<Int>
                    {
                        a += bit << (7-i)
                        i += 1
                    }
                    
                    (view as! NSTextView).toolTip = parseJson(row: row, value: a)
                    (view as! NSTextView).string = ((view as! NSTextView).toolTip?.replacingOccurrences(of: "\r\n", with: " "))!
                    
                }
                return (view as! NSView)
            
            case .none: break
            case .some(_): break
            
        }
        return nil
        
    }
}
