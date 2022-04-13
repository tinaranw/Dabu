//
//  InClipViewController.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 11/04/22.
//

import UIKit
import AVKit
import FloatingPanel

class InClipViewController: UIViewController, FloatingPanelControllerDelegate {

    @IBOutlet weak var clipPlayer: UIView!
    
    var player:AVPlayer!
    var avpController = AVPlayerViewController()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        let value = UIInterfaceOrientation.landscapeRight.rawValue
          UIDevice.current.setValue(value, forKey: "orientation")
        
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "zenitsu", ofType: "mp4")!)
        player = AVPlayer(url: url)
        avpController.player = player
        avpController.view.frame.size.height =  clipPlayer.frame.size.height
        avpController.view.frame.size.width =  clipPlayer.frame.size.width
        self.clipPlayer.addSubview(avpController.view)
        avpController.player?.volume = 0
        avpController.player?.play()
        
        
        let floatingPanel = FloatingPanelController()
        floatingPanel.delegate = self
        
        guard let floatingPanelController = storyboard?.instantiateViewController(withIdentifier: "floatingClipPanel") as? ClipPanelViewController else {
            return
        }
        
        floatingPanel.set(contentViewController: floatingPanelController)
        floatingPanel.addPanel(toParent: self)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeLeft
    }

    override var shouldAutorotate: Bool {
        return true
    }
    
    

}

extension UINavigationController {

override open var shouldAutorotate: Bool {
    get {
        if let visibleVC = visibleViewController {
            return visibleVC.shouldAutorotate
        }
        return super.shouldAutorotate
    }
}

override open var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation{
    get {
        if let visibleVC = visibleViewController {
            return visibleVC.preferredInterfaceOrientationForPresentation
        }
        return super.preferredInterfaceOrientationForPresentation
    }
}

override open var supportedInterfaceOrientations: UIInterfaceOrientationMask{
    get {
        if let visibleVC = visibleViewController {
            return visibleVC.supportedInterfaceOrientations
        }
        return super.supportedInterfaceOrientations
    }
}}
