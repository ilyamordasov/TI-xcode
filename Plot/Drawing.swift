//
//  Drawing.swift
//  Plot
//
//  Created by Ilya Mordasov on 06/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

class Drawing: NSView {
    
    var context:CGContext? = nil
    var data:[CGPoint] = []
    var _dirtyRect:NSRect!
    
    override func draw(_ dirtyRect: NSRect) {
        self.context = (NSGraphicsContext.current?.cgContext)!;
        _dirtyRect = dirtyRect
        super.draw(dirtyRect)
        drawBackground(rect: dirtyRect)
        drawIsolines(rect: dirtyRect)
        for i in data
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
        self.context?.drawPath(using: .fillStroke)
    }
    
    func drawIsolines(rect: NSRect)
    {
        self.context?.move(to: CGPoint(x:0,y:rect.height/2))
        self.context?.setStrokeColor(NSColor.black.cgColor)
        self.context?.addLine(to: CGPoint(x: rect.width, y: rect.height/2))
        self.context?.drawPath(using: .fillStroke)
    }
    
    public func add(point: NSPoint)
    {
        self.data.append(point)
    }
    
    public func removeData()
    {
        //self.data = []
        self.data.removeAll()
    }
    
    public func drawBezier(point: CGPoint)
    {
        self.context?.setStrokeColor(NSColor.blue.cgColor)
        self.context?.setLineWidth(2.0)
        self.context?.addLine(to: point)
        self.context?.drawPath(using: .fillStroke)
        self.context?.move(to: point)
    }
}
