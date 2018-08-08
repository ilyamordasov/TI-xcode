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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do view setup here.
        
        tableView.delegate = self as NSTableViewDelegate
        tableView.dataSource = self as NSTableViewDataSource
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
        return self.configs.labels.count
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
            
            case .none: break
            case .some(_): break
            
        }
        return nil
        
    }
}
