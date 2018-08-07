//
//  ViewController.swift
//  Plot
//
//  Created by Ilya Mordasov on 06/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    var X:Int = 0;
    var dr:Drawing!;
    var pv:PlotView!;
    var n:Int = 0;
    var dir:Bool = false;
    
    let regs:Array<String> = ["CONFIG1", "CONFIG2", "CONFIG3", "CONFIG4", "LOFF", "CH1SET", "CH2SET", "CH3SET", "CH4SET", "CH5SET", "CH6SET", "CH7SET", "CH8SET", "RLD_SENSP", "RLD_SENSN", "LOFF_SENSP", "LOFF_SENSN", "LOFF_FLIP", "LOFF_STATP", "LOFF_STATN", "GPIO", "PACE", "WCT1", "WCT2"]
    let addr:Array<UInt8> = [0x01, 0x02, 0x03, 0x17, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x18, 0x19]

    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var gr: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pv = PlotView(frame: NSRect(x: 10, y: 0, width: 500, height: 100))
        self.view.addSubview(pv)
        var gameTimer: Timer!
        //gameTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
        pv.test()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.target = self
        tableView.reloadData()
    }
    
    @objc func checkBoxClicked(_ sender:NSButton)
    {
        let cell = (sender.superview as! NSTableRowView)
        let row:Int = cell.value(forKey: "row") as! Int
        var a:Int = 0
        for i in 0...7
        {
            let view = tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 3+i) as! NSButton
            a += view.state.rawValue << (7-i)
        }
        let value = tableView.rowView(atRow: row, makeIfNecessary: true)?.view(atColumn: 2) as! NSTextField
        value.stringValue = String(format:"0x%02X", a)
    }

    @objc func runTimeCode()
    {
        let res = Int(randomNumber(inRange: 0...100))
        
        pv.addData(data: res)
        n += 1
    }
    
    func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        return T(value)
    }


    @IBAction func toggle_switch(_ sender: ITSwitch) {
        print("state \(sender.checked )")
        for subView in gr.subviews
        {
            if (subView.isKind(of: NSButton.self))
            {
                subView.setAccessibilityEnabled(sender.checked)
                (subView as! NSButton).isEnabled = sender.checked
            }
        }
    }
}

extension ViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return regs.count
    }
    
}

extension ViewController: NSTableViewDelegate {
    
    fileprivate enum CellIdentifiers {
        static let NameCell = "RegisterCellID"
        static let DateCell = "AddressCellID"
        static let SizeCell = "ValueCellID"
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var cellIdentifier: String = ""
        var view:(Any)? = nil
        
        switch tableColumn
        {
            case tableView.tableColumns[0]:
                view = NSTextField(string: regs[row])
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                break
            
            case tableView.tableColumns[1]:
                view = NSTextField(string: String("0x\(String(format:"%02X", addr[row]).uppercased())"))
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                break
            
            case tableView.tableColumns[3], tableView.tableColumns[4], tableView.tableColumns[5], tableView.tableColumns[6], tableView.tableColumns[7], tableView.tableColumns[8], tableView.tableColumns[9], tableView.tableColumns[10]:
                view = NSButton()
                (view as! NSButton).setButtonType(NSButton.ButtonType.switch)
                (view as! NSButton).title = ""
                (view as! NSButton).action = #selector(checkBoxClicked(_:))
                break
            
            case tableView.tableColumns[11]:
                view = ITSwitch()
                (view as! ITSwitch).setBoundsSize(NSSize(width: 32, height: 20))
                
                //(view as! ITSwitch).frame.size.height = 20
                (view as! ITSwitch).checked = true
                break
            
            case tableView.tableColumns[2]:
                view = NSTextField()
                (view as! NSTextField).stringValue = "0x00"
                (view as! NSTextField).isEditable = false
                (view as! NSTextField).isBordered = false
                (view as! NSTextField).backgroundColor = .clear
                break
            
            case .none: break
            
            case .some(_): break
            
        }
        return (view as! NSView)
    
    }
}
