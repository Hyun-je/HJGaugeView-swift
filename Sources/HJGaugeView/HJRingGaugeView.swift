//
//  HJRingGaugeView.swift
//  HJGaugeView
//
//  Created by ParkJaeHyeon on 2016. 8. 26..
//  Copyright © 2016년 Jason Park. All rights reserved.
//

import UIKit


@IBDesignable
public final class HJRingGaugeView: HJGaugeView {
    
    override func initLayer() {
        super.initLayer()
        
        delegate = self
    }
    
}


extension HJRingGaugeView: HJGaugeViewDelegate {
    
    func gaugePath() -> CGPath {
        
        let barWidth = gaugeWidth()
        let radius = (min(frame.height, frame.width) - barWidth)/2
        
        let centerX = frame.width/2
        let centerY = frame.height/2
        
        let linePath = UIBezierPath()
        linePath.addArc(
            withCenter: CGPoint(x:centerX, y:centerY),
            radius: radius,
            startAngle: CGFloat(-Double.pi/2),
            endAngle: CGFloat(Double.pi/2*3),
            clockwise: true
        )
        
        return linePath.cgPath
    }
    
    func gaugeWidth() -> CGFloat {
        
        return min(frame.height, frame.width)/10
    }
    
}
