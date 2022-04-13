//
//  ClipPanelViewController.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 12/04/22.
//

import UIKit

class ClipPanelViewController: UIViewController {

    @IBOutlet weak var customizeSubButton: UIButton!{
        didSet{
            customizeSubButton.setImage(UIImage(named:"unchecked"), for: .normal)
            customizeSubButton.setImage(UIImage(named:"checked"), for: .selected)
               }
    }
   
    @IBOutlet weak var customizeCharaButton: UIButton! {
        didSet{
            customizeCharaButton.setImage(UIImage(named:"unchecked"), for: .normal)
            customizeCharaButton.setImage(UIImage(named:"checked"), for: .selected)
               }
    }
    @IBOutlet weak var customizeEngButton: UIButton! {
        didSet{
            customizeEngButton.setImage(UIImage(named:"unchecked"), for: .normal)
            customizeEngButton.setImage(UIImage(named:"checked"), for: .selected)
               }
    }
    @IBAction func turnOnRomaji(_ sender: UIButton) {
        sender.checkboxAnimation {
                    print(sender.isSelected)

                }
    }
    
    @IBAction func turnOnChara(_ sender: UIButton) {
        sender.checkboxAnimation {
                    print(sender.isSelected)

                }
    }
    
    @IBAction func turnOnEng(_ sender: UIButton) {
        sender.checkboxAnimation {
                    print(sender.isSelected)

                }
    }
    
    @IBOutlet weak var finishButton: UIButton!
    
    @objc func tapOnFinishButton(){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "resultStoryboard") as? ResultViewController{
            show(vc, sender: self)
        }
        
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishButton.addTarget(self, action: #selector(tapOnFinishButton), for: .touchUpInside)
       
    

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    

}
extension UIButton {
    //MARK:- Animate check mark
    func checkboxAnimation(closure: @escaping () -> Void){
        guard let image = self.imageView else {return}
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.isSelected = !self.isSelected
                //to-do
                closure()
                image.transform = .identity
            }, completion: nil)
        }
        
    }
}
