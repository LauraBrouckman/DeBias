//
//  ProgressBarView.swift
//  DeBias
//
//  Created by Elizabeth Brouckman on 11/22/16.
//  Copyright © 2016 debias. All rights reserved.
//

import UIKit

class ProgressBarView: UIView {
    
    
    //These values are set in the viewController to adjust the proportion of the inner
    //Rectangle and the color of the inner rectangle
    var progressBarProportion = 0.5
    var progressBarColor = UIColor.redColor()
    var goalLineProportion = 0.5
    var goal = 0
    
    var label = UILabel()
    
    override func drawRect(rect: CGRect) {
        //Make outer rectangle
        let maxBarWidth = bounds.size.width - 60
        let barStartX = bounds.minX + 10
        
        let largeRect = UIBezierPath(roundedRect: CGRectMake(barStartX, bounds.minY + 20, maxBarWidth, 50), cornerRadius: 6)
        UIColor(red: 196/255, green: 196/255, blue: 196/255, alpha: 1.0).set()
        largeRect.fill()
        largeRect.lineWidth = 1.5
        largeRect.stroke()
        // Make inner rectangle to show progress
        let progressRect = UIBezierPath(roundedRect: CGRectMake(barStartX, bounds.minY + 20, CGFloat(progressBarProportion) * maxBarWidth, 50), cornerRadius: 6)
        progressBarColor.set()
        progressRect.fill()
        progressRect.lineWidth = 1.5
        progressRect.stroke()
        
        // Make line that shows where the goal is set
        
        
        let  path = UIBezierPath()
        let  p0 = CGPointMake(barStartX + CGFloat(goalLineProportion) * maxBarWidth, bounds.minY + 15)
        path.moveToPoint(p0)
        
        let p1 = CGPointMake(barStartX + CGFloat(goalLineProportion) * maxBarWidth, bounds.maxY - 25)
        path.addLineToPoint(p1)
        
        let  dashes: [ CGFloat ] = [ 4.0, 4.0 ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        
        path.lineWidth = 1.5
        path.lineCapStyle = .Butt
        UIColor.blackColor().set()
        path.stroke()
        
        // Add label
        label.frame = CGRectMake(bounds.minX, bounds.minY, bounds.maxX, bounds.maxY)
        label.center = CGPointMake(barStartX + CGFloat(goalLineProportion) * maxBarWidth, bounds.maxY - 15)
        label.textAlignment = NSTextAlignment.Center
        label.text = String(goal)
        self.addSubview(label)
        // Add button ?
        
    }
    
}
