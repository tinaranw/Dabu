//
//  ResultViewController.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 12/04/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultAccuracyBar: UIView!
    
    @IBOutlet weak var circularProgress: UIView!
    
    @IBOutlet weak var animatedCountingLabel: UILabel!
    
    @IBOutlet weak var replayButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let circularProgress = CircularProgressBarView(frame: CGRect(x: 10.0, y: 30.0, width: 100.0, height: 100.0))
                circularProgress.progressColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 1.0)
                circularProgress.trackColor = UIColor(red: 52.0/255.0, green: 141.0/255.0, blue: 252.0/255.0, alpha: 0.6)
                circularProgress.tag = 101
                circularProgress.center = self.view.center
//                self.view.addSubview(circularProgress)
                
//                //animate progress
                self.perform(#selector(animateProgress), with: nil, afterDelay: 0.3)
        
        
        replayButton.addTarget(self, action: #selector(tapOnReplayButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(tapOnBackButton), for: .touchUpInside)
        
        
    }
    
       @objc func animateProgress() {
           let cp = self.view.viewWithTag(101) as! CircularProgressBarView
           cp.setProgressWithAnimation(duration: 1.0, value: 0.8)
       }

       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }
    
    @objc func tapOnReplayButton(){
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "InClipStoryboard") as? InClipViewController{
            show(vc, sender: self)
        }
    }
    @objc func tapOnBackButton(){
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "watchNowStoryboard") as? WatchNowVC{
            show(vc, sender: self)
        }

    }
    

}
    
