//
//  CanvasViewController.swift
//  LearningAnimations
//
//  Created by Saurabh Shah on 10/1/15.
//  Copyright © 2015 Saurabh Shah. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    
    var trayOriginalCenter: CGPoint!
    var isTrayUp: Bool = true
    
    @IBAction func onTrayPanGesture(panGestureRecognizer: UIPanGestureRecognizer) {
        let point = panGestureRecognizer.locationInView(view)
        let velocity = panGestureRecognizer.velocityInView(view)
        if self.isTrayUp{
            if velocity.y > 0{
                if panGestureRecognizer.state == UIGestureRecognizerState.Began {
                    trayOriginalCenter = trayView.center
                    print("Gesture began at: \(point)")
                } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
                    trayView.center = CGPoint(x: trayOriginalCenter.x, y: point.y)
                } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                    trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + 150)
                    self.isTrayUp = false
                }
            }
        } else{
            if velocity.y < 0{
                if panGestureRecognizer.state == UIGestureRecognizerState.Began {
                    trayOriginalCenter = trayView.center
                    print("Gesture began at: \(point)")
                } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
                    trayView.center = CGPoint(x: trayOriginalCenter.x, y: point.y)
                } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                    trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y - 150)
                    self.isTrayUp = true
                    
                }
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isTrayUp = true
        trayOriginalCenter = trayView.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
