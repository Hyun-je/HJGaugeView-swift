//
//  HJBarGaugeView.swift
//  HJGaugeView
//
//  Created by ParkJaeHyeon on 2016. 8. 26..
//  Copyright © 2016년 Jason Park. All rights reserved.
//

import UIKit


@IBDesignable
public final class HJBarGaugeView: HJGaugeView {
    
    override func initLayer() {
        super.initLayer()
        
        delegate = self
    }
    
}


extension HJBarGaugeView: HJGaugeViewDelegate {
    
    func gaugePath() -> CGPath {
        
        let barWidth = gaugeWidth()
        let leftX = barWidth/2
        let rightX = frame.width - barWidth/2
        let centerY = frame.height/2
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x:leftX, y:centerY))
        linePath.addLine(to: CGPoint(x:rightX, y:centerY))

        return linePath.cgPath
    }
    
    func gaugeWidth() -> CGFloat {
        
        return frame.height
    }
    
}
