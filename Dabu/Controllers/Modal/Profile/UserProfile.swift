//
//  UserProfile.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 06/04/22.
//

import UIKit

class UserProfile: UIViewController {
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    
    @IBOutlet weak var slideIndicator: UIView!
    @IBOutlet weak var progressTrackerIndicator: UIView!
    @IBOutlet weak var doneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        
        slideIndicator.roundCorners(.allCorners, radius: 10)
//
//        let progressTrackerIndicator = ProgressTrackerBarView(frame: CGRect(x: 10.0, y: 30.0, width: 100.0, height: 100.0))
//        progressTrackerIndicator.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
//        progressTrackerIndicator.trackColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 0.6)
//        progressTrackerIndicator.tag = 102
//        progressTrackerIndicator.center = self.view.center
//
////                //animate progress
//                self.perform(#selector(animateProgress), with: nil, afterDelay: 0.3)
    }
    
    @IBAction func onDoneTapped(_ sender: Any) {
        closeTapped()
    }
    @objc func closeTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
//       @objc func animateProgress() {
//           let cp = self.view.viewWithTag(102) as! ProgressTrackerBarView
//           cp.setProgressWithAnimation(duration: 1.0, value: 0.8)
//       }

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}
