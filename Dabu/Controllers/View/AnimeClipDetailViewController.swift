//
//  AnimeClipDetailViewController.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 11/04/22.
//

import UIKit

class AnimeClipDetailViewController: UIViewController {

    @IBOutlet weak var transcriptTextView: UITextView!
    @IBOutlet weak var character2Button: UIButton!
    @IBOutlet weak var character1Button: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var animeClipThumbnail: UIImageView!
    @IBOutlet weak var animeClipTitle: UILabel!
    
    var clip_title: String = ""
    var clip_thumbnail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.hidesBarsOnSwipe = false
        
        let value = UIInterfaceOrientation.portrait.rawValue
          UIDevice.current.setValue(value, forKey: "orientation")

        character1Button.layer.cornerRadius = character1Button.frame.width / 2
        character1Button.layer.masksToBounds = true
        character1Button.setImage(UIImage(named: "tanjiropp"), for: .normal)
       
        character2Button.layer.cornerRadius = character2Button.frame.width / 2
        character2Button.layer.masksToBounds = true
        character2Button.setImage(UIImage(named: "gyupp"), for: .normal)
        
        transcriptTextView.layer.cornerRadius = 10
        
        playButton.addTarget(self, action: #selector(tapOnPlayButton), for: .touchUpInside)
        
        animeClipTitle.text = clip_title
        animeClipThumbnail.image = UIImage(named: clip_thumbnail)
    }
    
    @objc func tapOnPlayButton(){
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "InClipStoryboard") as? InClipViewController{
            show(vc, sender: self)
        }
    }
    
}



