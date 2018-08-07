//
//  ViewController.swift
//  Plate Shaker Annimation
//
//  Created by Warren Hansen on 8/6/18.
//  Copyright © 2018 Warren Hansen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var circleView: UIView!
    
    @IBOutlet weak var plateLabel: UILabel!
    
    @IBOutlet weak var shakerLabel: UILabel!
    
    let outerRimLayer = CAShapeLayer()
    
    let innerRimLayer = CAShapeLayer()
    
    var outerRim: UIBezierPath{
        let bezierPath = UIBezierPath()
        let arcCenter = CGPoint(x: circleView.frame.size.height / 2 , y: circleView.frame.size.width / 2)
        bezierPath.addArc(withCenter: arcCenter, radius: 140.0, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        return bezierPath
    }
    
    var innerRim: UIBezierPath{
        let bezierPath = UIBezierPath()
        let arcCenter = CGPoint(x: circleView.frame.size.height / 2 , y: circleView.frame.size.width / 2)
        bezierPath.addArc(withCenter: arcCenter, radius: 130.0, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        return bezierPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plateLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
        shakerLabel.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        annimatePlate()
        annimateShaker()
    }

    func annimatePlate() {
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.0,
            usingSpringWithDamping: 0.3,
            initialSpringVelocity: 4.0,
            options: [],
            animations: {
                self.plateLabel?.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.view.layoutIfNeeded()
        }) { (finished) in
            if finished {
               self.annimateInnerRim()
            }
        }
    }
    
    func annimateShaker() {
        
        UIView.animate(
            withDuration: 1.0,
            delay: 0.75,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 4.0,
            options: [],
            animations: {
                self.shakerLabel?.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.view.layoutIfNeeded()
        }) { (finished) in
            if finished {
                //self.annimateInnerRim()
                self.annimateOuterRim()
            }
        }
    }
    
    func annimateInnerRim() {
        
        innerRimLayer.path = innerRim.cgPath
        
        let customGreen:CGColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        innerRimLayer.strokeColor = customGreen
        innerRimLayer.fillColor = UIColor.clear.cgColor
        innerRimLayer.lineWidth = 2.0
        innerRimLayer.lineCap = kCALineCapRound
        circleView.layer.addSublayer(innerRimLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.byValue = 1.0
        animation.duration = 0.65
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        innerRimLayer.add(animation, forKey: "drawLineAnimation")
    }
    
    func annimateOuterRim() {
        
        outerRimLayer.path = outerRim.cgPath
        
        let customGreen:CGColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        outerRimLayer.strokeColor = customGreen
        outerRimLayer.fillColor = UIColor.clear.cgColor
        outerRimLayer.lineWidth = 6.0
        outerRimLayer.lineCap = kCALineCapRound
        circleView.layer.addSublayer(outerRimLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.byValue = 1.0
        animation.duration = 0.65
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        outerRimLayer.add(animation, forKey: "drawLineAnimation")
    }
    
    
}

