//
//  ViewController.swift
//  CAlayer
//
//  Created by Anton Zyabkin on 23.12.2022.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    var gradientLayer: CAGradientLayer! {
        didSet{
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            let startColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
            let endColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1).cgColor
            gradientLayer.colors = [startColor, endColor]
        }
    }
    
    var shapeLayer: CAShapeLayer! {
        didSet {
            shapeLayer.lineWidth = 20
            shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shapeLayer.fillColor = nil
            shapeLayer.strokeEnd = 1
            shapeLayer.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            
        }
    }
    
    var overshapeLayer: CAShapeLayer! {
        didSet {
            overshapeLayer.lineWidth = 20
            overshapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
            overshapeLayer.fillColor = nil
            overshapeLayer.strokeEnd = 0
            overshapeLayer.strokeColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1).cgColor
            
        }
    }

    @IBOutlet weak var imageView: UIImageView! {
        didSet{
            imageView.layer.cornerRadius = imageView.bounds.size.height/4
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 5
            imageView.layer.borderColor = UIColor.cyan.cgColor
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 10
            button.layer.shadowOffset = CGSize(width: 15, height: 15)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowColor = UIColor.cyan.cgColor
            button.layer.shadowRadius = 20
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
        shapeLayer = CAShapeLayer()
        view.layer.addSublayer(shapeLayer)
        overshapeLayer = CAShapeLayer()
        view.layer.addSublayer(overshapeLayer)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size
            .height)
        
        shapeLayer.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2))
        path.addLine(to: CGPoint(x: self.view.frame.width/2 + 100, y: self.view.frame.height/2))
        shapeLayer.path = path.cgPath
        
        overshapeLayer.frame = view.bounds
        overshapeLayer.path = path.cgPath
    }
    @IBAction func actionUIButton(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 0.2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fillMode = CAMediaTimingFillMode.both
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        overshapeLayer.add(animation, forKey: nil)
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "second", sender: self)
        
    }
}

