//
//  ViewController.swift
//  CALayout_CARaplicationLayer_SwiftBook
//
//  Created by Anton Zyabkin on 24.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var replicatorLayer: CAReplicatorLayer!
    var sourceLayer: CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()

//        spinerCumtomView()
        appleExample()
        
    }
    func appleExample() {
        let replicatorLayer = CAReplicatorLayer()
        
        let redSquer = CALayer()
        redSquer.backgroundColor = UIColor.white.cgColor
        redSquer.frame = CGRect(x: 10, y: 100, width: 50, height: 50)
        let instanceCount = 5
        
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(60, 0, 0)
        let offsetStep = -1 / Float(instanceCount)
        
        replicatorLayer.instanceBlueOffset = offsetStep
        replicatorLayer.instanceGreenOffset = offsetStep
        
        replicatorLayer.addSublayer(redSquer)
        
        let outerReplicatorLayer = CAReplicatorLayer()
        replicatorLayer.instanceDelay = 10

        outerReplicatorLayer.addSublayer(replicatorLayer)
        
        outerReplicatorLayer.instanceCount = instanceCount
        outerReplicatorLayer.instanceTransform = CATransform3DMakeTranslation(0, 60, 0)
        outerReplicatorLayer.instanceRedOffset = offsetStep
        outerReplicatorLayer.instanceDelay = 1

        view.layer.addSublayer(outerReplicatorLayer)
    }
    func spinerCumtomView() {
        replicatorLayer = CAReplicatorLayer()
        sourceLayer = CALayer()
        view.layer.addSublayer(replicatorLayer)
        replicatorLayer.addSublayer(sourceLayer)
        startAnimation(delay: 0.02, replicates: 30)
    }

    override func viewWillLayoutSubviews() {
//        replicatorLayer.frame = view.bounds
//        replicatorLayer.position = view.center
//        sourceLayer.frame = CGRect(x: 0, y: 0, width: 3, height: 5)
//        sourceLayer.backgroundColor = UIColor.white.cgColor
//        sourceLayer.position = view.center
//        sourceLayer.anchorPoint = CGPoint(x: 0, y: 5)
    }

    func startAnimation(delay: TimeInterval, replicates: Int) {
        replicatorLayer.instanceCount = replicates
        let angel = CGFloat(2*Double.pi)/CGFloat(replicates)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 0.1)
        replicatorLayer.instanceDelay = delay
        sourceLayer.opacity = 0
        let opaacityAnimaiton = CABasicAnimation(keyPath: "opacity")
        opaacityAnimaiton.fromValue = 1
        opaacityAnimaiton.toValue = 0
        opaacityAnimaiton.duration = Double(replicates) * delay
        opaacityAnimaiton.repeatCount = Float.infinity
        sourceLayer.add(opaacityAnimaiton, forKey: nil)
    }
}

