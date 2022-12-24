//
//  SecondViewController.swift
//  CAlayer
//
//  Created by Anton Zyabkin on 23.12.2022.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate {
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 0
            shapeLayer.strokeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor
            
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let path = UIBezierPath()

        path.addArc(withCenter: imageView.center, radius: imageView.frame.size.width/2 - 10, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        
        shapeLayer.path = path.cgPath
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        shapeLayer.add(animation, forKey: nil)
    }
    
}
