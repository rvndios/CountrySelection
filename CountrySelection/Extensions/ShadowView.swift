//
//  ShadowView.swift
//  CountrySelection
//
//  Created by user on 04/04/20.
//  Copyright © 2020 Aravind. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class ShadowView: UIView {
    let containerView = UIView()
    private var shadowLayer: CAShapeLayer!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = self.backgroundColor?.cgColor
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 3
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
// MARK: Shadow view with round corners
class RoundShadowView: UIView {
    let containerView = UIView()
    private var shadowLayer: CAShapeLayer!
    private var fillColor: UIColor = UIColor.init(named: "fillColor")  ?? UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = fillColor.cgColor
            //shadowLayer.fillColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0).cgColor
            shadowLayer.shadowColor = UIColor.black.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            shadowLayer.shadowOpacity = 0.2
            shadowLayer.shadowRadius = 3
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}
