//
//  HJGaugeView.swift
//  HJGaugeView
//
//  Created by ParkJaeHyeon on 2016. 8. 26..
//  Copyright © 2016년 Jason Park. All rights reserved.
//

import UIKit


protocol HJGaugeViewDelegate {
    
    func gaugePath() -> CGPath
    func gaugeWidth() -> CGFloat
    
}



@IBDesignable
public class HJGaugeView: UIView {
    
    private let maximumLayer = CAShapeLayer()
    private let minimumLayer = CAShapeLayer()
    
    @IBInspectable public var maximumColor = UIColor.systemBlue
    @IBInspectable public var minimumColor = UIColor.systemGray
    
    public var value = 0.0 {
        willSet { valueOld = value }
        didSet  { animate() }
    }
    private var valueOld = 0.0
    
    var delegate: HJGaugeViewDelegate?


    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayer()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initLayer()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        configLayer()
    }
    
    
    
    internal func initLayer() {

        #if swift(>=4.2)
        maximumLayer.lineCap = .round
        minimumLayer.lineCap = .round
        #else
        maximumLayer.lineCap = kCALineCapRound
        minimumLayer.lineCap = kCALineCapRound
        #endif
        
        layer.addSublayer(minimumLayer)
        layer.addSublayer(maximumLayer)
    }
    
    internal func configLayer() {
        
        maximumLayer.strokeColor = maximumColor.cgColor
        minimumLayer.strokeColor = minimumColor.cgColor
        
        maximumLayer.fillColor = UIColor.clear.cgColor
        minimumLayer.fillColor = UIColor.clear.cgColor
        
        maximumLayer.path = delegate?.gaugePath()
        minimumLayer.path = delegate?.gaugePath()
        
        maximumLayer.lineWidth = delegate?.gaugeWidth() ?? CGFloat.zero
        minimumLayer.lineWidth = delegate?.gaugeWidth() ?? CGFloat.zero
        
    }
    
    private func animate(duration: TimeInterval = 0.8) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")

        animation.fromValue = valueOld
        animation.toValue = value
        
        animation.duration = duration
        animation.isRemovedOnCompletion = false // don't remove after finishing
        
        #if swift(>=4.2)
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.fillMode = .both // keep to value after finishing
        #else
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        #endif
        
        maximumLayer.add(animation, forKey: nil)
    }
    
}

