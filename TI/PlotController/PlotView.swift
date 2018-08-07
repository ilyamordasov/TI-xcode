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
    var data:[CGPoint] = []
    var _dirtyRect:NSRect!
    var x:Int = 0;
    
    override func draw(_ dirtyRect: NSRect) {
        self.context = (NSGraphicsContext.current?.cgContext)!;
        _dirtyRect = dirtyRect
        super.draw(dirtyRect)
        drawBackground(rect: dirtyRect)
        drawHorizontalSegments(rect: dirtyRect)
        drawVerticalSegments(rect: dirtyRect)
        drawIsolines(rect: dirtyRect)
        for i in self.data
        {
            drawBezier(point: i)
        }
    }
    
    func drawBackground(rect: NSRect)
    {
        
        self.context?.move(to: CGPoint(x:0,y:0))
        //context!.setStrokeColor(NSColor.black.cgColor)
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
    
    public func add(point: Int)
    {
        self.data.append(CGPoint(x: x, y: Int(_dirtyRect.height/2) + point))
        x += 1
        if (x >= Int(_dirtyRect.width))
        {
            x = 0
            self.context?.move(to: CGPoint(x:0, y:0))
        }
    }
    
    public func removeData()
    {
        self.data = []
        //self.data.removeAll()
    }
    
    public func drawBezier(point: CGPoint)
    {
        self.context?.setStrokeColor(NSColor.blue.cgColor)
        self.context?.setLineWidth(1.0)
        self.context?.addLine(to: point)
        self.context?.drawPath(using: .fillStroke)
        self.context?.move(to: point)
    }
}
