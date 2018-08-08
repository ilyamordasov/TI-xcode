//
//  PlotView.swift
//  TI
//
//  Created by Ilya Mordasov on 07/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

class PlotView: NSView {

    var context:CGContext? = nil
    var data:[Int] = []
    let offset:Int = 50;
    var min:Int = 0
    var max:Int = 0
    
    override func draw(_ dirtyRect: NSRect)
    {
        self.context = (NSGraphicsContext.current?.cgContext)!;
        super.draw(dirtyRect)
        drawBackground(rect: dirtyRect)
        drawHorizontalSegments(rect: dirtyRect)
        drawVerticalSegments(rect: dirtyRect)
        drawIsolines(rect: dirtyRect)
        
        if self.data.count > 1
        {
            //self.subviews.map({ $0.removeFromSuperview() })
            self.subviews.forEach({ $0.removeFromSuperview() })
            
            self.min = self.data.min()!
            self.max = self.data.max()! + 1
            drawVerticalLabels(rect:dirtyRect)
            
            for i in 0...self.data.count-1
            {
                drawBezier(index: i)
            }
        }
    }
    
    func drawBackground(rect: NSRect)
    {
        
        self.context?.move(to: CGPoint(x:0,y:0))
        self.context?.setFillColor(NSColor.white.cgColor)
        self.context?.addRect(CGRect(x: 0, y: 0, width: rect.width, height: rect.height))
        //
        self.context?.drawPath(using: .fill)
    }
    
    func drawIsolines(rect: NSRect)
    {
        self.context?.move(to: CGPoint(x:0,y:rect.height/2))
        self.context?.setStrokeColor(NSColor.black.cgColor)
        self.context?.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
        self.context?.drawPath(using: .fillStroke)
    }
    
    func drawHorizontalSegments(rect: NSRect)
    {
        for i in stride(from:10, through:Int(rect.width-10), by:10)
        {
            self.context?.move(to: CGPoint(x:i,y:0))
            self.context?.setStrokeColor(CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.03))
            self.context?.addLine(to: CGPoint(x: i, y: Int(rect.height)))
            self.context?.setLineWidth(0.5)
            self.context?.drawPath(using: .fillStroke)
        }
    }
    
    func drawVerticalSegments(rect: NSRect)
    {
        for i in stride(from: 10, through: Int(rect.height-10), by:10)
        {
            self.context?.move(to: CGPoint(x:0,y:i))
            self.context?.setStrokeColor(CGColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.03))
            self.context?.addLine(to: CGPoint(x: Int(rect.width), y: i))
            self.context?.setLineWidth(0.5)
            self.context?.drawPath(using: .fillStroke)
        }
    }
    
    func drawVerticalLabels(rect: NSRect)
    {
        let diff:Int = self.max - self.min
        for i in 0...1
        {
            var y:Int = 0
            var text:String = ""
            if i == 0
            {
                y = Int(self.frame.height/2) + Int(0 - Int(self.frame.height)/2 + offset)
                text = "\(min)"
            }
            else
            {
                y = Int(self.frame.height/2) + Int(self.frame.height)/2 - offset
                text = "\(max)"
            }
            self.context?.move(to: CGPoint(x:0,y:y))
            self.context?.setStrokeColor(CGColor.black)
            self.context?.addLine(to: CGPoint(x: 10, y: y))
            self.context?.setLineWidth(0.5)
            self.context?.drawPath(using: .fillStroke)
            
            let label:NSTextField = NSTextField(frame: NSMakeRect(15, CGFloat(y)-12, 30, 20))
            label.stringValue = text
            label.font = NSFont(name: "Lucida Sans", size: 8.0)
            label.isEditable = false
            label.isBordered = false
            label.backgroundColor = .clear
            label.autoresizesSubviews = true
            self.addSubview(label)
        }
    }
    
    public func add(point: Int)
    {
        if (data.count >= Int(self.frame.width))
        {
            data.remove(at: 0)
        }
        self.data.append(point)
    }
    
    public func removeData()
    {
        self.data = []
    }
    
    public func drawBezier(index: Int)
    {
        let y_old:Int = (index == 0) ? 0 : map(x: self.data[index-1], in_min: min, in_max: max, out_min: 0 - Int(self.frame.height/2) + offset, out_max: Int(self.frame.height/2) - offset)
        let y: Int = map(x: self.data[index], in_min: min, in_max: max, out_min: 0 - Int(self.frame.height/2) + offset, out_max: Int(self.frame.height/2) - offset)
        
        let scaledY_old:Int = Int(self.frame.height/2) + y_old
        let scaledY:Int = Int(self.frame.height/2) + y
        
        self.context?.setStrokeColor(NSColor.lightGray.cgColor)
        self.context?.setLineWidth(1.0)
        self.context?.move(to: CGPoint(x: index-1, y: scaledY_old))
        self.context?.addLine(to: CGPoint(x: index, y: scaledY))
        self.context?.drawPath(using: .fillStroke)
    }
    
    func map(x: Int, in_min: Int, in_max:Int, out_min: Int, out_max: Int) -> Int
    {
        return Int((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min);
    }
}
