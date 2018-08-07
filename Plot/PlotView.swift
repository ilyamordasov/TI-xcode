//
//  PlotView.swift
//  Plot
//
//  Created by Ilya Mordasov on 06/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

class PlotView: NSView {
    private var path: NSBezierPath = NSBezierPath()
    private var x:Int = 0;
    private var context:CGContext? = nil
    private var rect:NSRect!
    private var curPos:NSPoint = NSPoint(x:0, y:0)
    
    override func draw(_ dirtyRect: NSRect) {
        rect = dirtyRect
        super.draw(dirtyRect)
        self.context = (NSGraphicsContext.current?.cgContext)!
        self.context?.move(to: CGPoint(x:0,y:0))
        self.context?.setFillColor(NSColor.white.cgColor)
        self.context?.addRect(CGRect(x: 0, y: 0, width: dirtyRect.width, height: dirtyRect.height))
        self.context?.drawPath(using: .fillStroke)
        
        self.context?.move(to: CGPoint(x:0,y:dirtyRect.height/2))
        self.context?.setStrokeColor(NSColor.black.cgColor)
        self.context?.addLine(to: CGPoint(x: dirtyRect.width, y: dirtyRect.height/2))
        self.context?.drawPath(using: .fillStroke)
        self.curPos = NSPoint(x:0, y:Int(dirtyRect.height/2))
        self.path.move(to: curPos)
        
        NSColor.blue.setStroke()
        self.path.lineWidth = 2.0
        self.path.lineCapStyle = .roundLineCapStyle
        self.path.stroke()
    }
    
    public func addData(data:Int)
    {
        let point:NSPoint = NSPoint(x:self.x, y:Int(rect.height/2)+data)
        //print(point)
        self.x += 1
        print(self.x)
        if (x >= Int(rect.width))
        {
            
            x = 0
            self.path.removeAllPoints()
            self.curPos = NSPoint(x:0, y:Int(rect.height/2))
//            self.setNeedsDisplay(self.rect)
        }
        self.path.move(to: curPos)
        self.path.relativeLine(to: point)
        //self.curPos = NSPoint(x:point.x, y:point.y)
        self.setNeedsDisplay(self.rect)
    }
    
    public func test()
    {
        self.path.move(to: NSPoint(x: 0, y:0))
        self.path.line(to: NSPoint(x: 0, y:0))
        for i in 0...500
        {
             let length = Int(50 - 0 + 1)
            let value = Int(arc4random()) % length + 0
            self.path.move(to: NSPoint(x: i, y:value))
            self.path.relativeLine(to: NSPoint(x: i, y:value))
        }
    }
}
