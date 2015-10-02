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
//        let point = panGestureRecognizer.locationInView(view)
        
        let velocity = panGestureRecognizer.velocityInView(view)
        if self.isTrayUp{
            if velocity.y > 0{
                if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                    
                    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                        self.trayView.center = CGPoint(x: self.trayOriginalCenter.x, y: self.trayOriginalCenter.y + 150)
                        }, completion:nil)
                    
                    self.isTrayUp = false
                }
            }
        } else{
            if velocity.y < 0{
                if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                    
                    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { () -> Void in
                        self.trayView.center = self.trayOriginalCenter
                        }, completion:nil)
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
