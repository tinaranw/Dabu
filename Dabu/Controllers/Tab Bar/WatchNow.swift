//
//  ViewController.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 04/04/22.
//

import AVKit
import UIKit

class WatchNowVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var selectedAnimeTitle = ""
    private var selectedAnimeThumbnail = ""
    private var selectedClipTitle = ""
    private var selectedClipThumbnail = ""
    
    
    //Variable Initizialisation
    var otherClipsThumbnails:[String]=["ghibli1", "ghibli2", "ghibli3"]
    var recommendedAnimeThumbnail:[String]=["ghibli1a", "ghibli2a", "ghibli3a"]
    var clips:[Clips]=[
        Clips(image: "tanjiro2", title: "Trainer Sakonji Urokodaki"),
        Clips(image: "tanjiro3", title: "Sabito and Makomo"),
        Clips(image: "tanjiro4", title: "Final Selection"),
        Clips(image: "tanjiro5", title: "My Own Steel"),
    ]
    
    var animes:[Anime]=[
        Anime(image: "komi-san-wa-comyushou-desu-2nd-season", title: "Komi-san wa, Comyushou desu. 2nd Season",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "detective-conan", title: "Detective Conan",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "One-piece", title: "One Piece",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "super-psycho-love", title: "Super Psycho Love",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "kaguya-sama-wa-kokurasetai-ultra-romantic", title: "Kaguya-sama wa Kokurasetai: Ultra Romantic",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "chiikawa", title: "Chiikawa",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
    ]
    
    //UI Initialization
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var continueWatchingThumbnail: UIImageView!
    
    @IBOutlet weak var profileButton: UIButton!
    
    
    //Interaction
    @IBAction func onProfileButtonTapped(_ sender: Any) {
        showUserProfile()
    }
    
    //Modal Sheet
    @objc func showUserProfile() {
        print("show User")
        let slideVC = UserProfile()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true, completion: nil)
    }
    
    
    //Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionView.viewWithTag(1){
            return clips.count
            }else{
                return animes.count
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionView.viewWithTag(1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "otherClipsCell", for: indexPath) as! OtherClipsCollectionCell
//            cell.myOtherClipsThumbnails.image=UIImage(named: otherClipsThumbnails[indexPath.row])
            let clip = clips[indexPath.row]
                  cell.myOtherClipsThumbnails.image = UIImage(named: clip.image)
                  cell.myOtherClipsTitle.text = clip.title
            cell.myOtherClipsThumbnails.layer.cornerRadius=10.0
            return cell
            }else{
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedAnimeCell", for: indexPath) as! RecommendedCollectionCell
                let anime = animes[indexPath.row]
                cell.myRecommendedAnimeThumbnails.image = UIImage(named: anime.image)
                cell.myRecommendedAnimeTitle.text = anime.title
                cell.myRecommendedAnimeThumbnails.layer.cornerRadius=10.0
                return cell
            }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if collectionView == collectionView.viewWithTag(1){
            if let vc = storyboard?.instantiateViewController(withIdentifier: "animeClipDetailStoryboard") as? AnimeClipDetailViewController{
                //print(anime_lists[indexPath.item].title)
                selectedClipTitle = clips[indexPath.item].title
                selectedClipThumbnail = clips[indexPath.item].image
                vc.clip_title = selectedClipTitle
                vc.clip_thumbnail = selectedClipThumbnail
                show(vc, sender: self)
            }
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "animeDetailStoryboard") as? AnimeDetailViewController{
                //print(anime_lists[indexPath.item].title)
                selectedAnimeTitle = animes[indexPath.item].title
                selectedAnimeThumbnail = animes[indexPath.item].image
                vc.anime_title = selectedAnimeTitle
                vc.anime_thumbnail = selectedAnimeThumbnail
                show(vc, sender: self)
            }
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //round profile pic
        self.title = "Watch Now"
        let value = UIInterfaceOrientation.portrait.rawValue
          UIDevice.current.setValue(value, forKey: "orientation")

        profileButton.layer.cornerRadius = profileButton.frame.width / 2
        profileButton.layer.masksToBounds = true
        navigationController?.hidesBarsOnSwipe = false
        self.view.layoutIfNeeded()
//        self.profilePic.layer.cornerRadius = self.profilePic.frame.width/2.0
//        self.profilePic.clipsToBounds = true
//        self.profilePic.layer.masksToBounds = true
        
//        profileButton.setImage(UIImage(named: "profilepic"), for: .normal)
//
//        profileButton.imageView?.contentMode = .scaleAspectFit
//        profileButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
//        profileButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        continueWatchingThumbnail.layer.cornerRadius=10.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(WatchNowVC.tappedMe))
        continueWatchingThumbnail.addGestureRecognizer(tap)
        continueWatchingThumbnail.isUserInteractionEnabled = true
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc
    func tappedMe() {
        print("Tapped")
        guard let path = Bundle.main.path(forResource: "animeclip", ofType: "mp4") else {
            return
        }
        let videoURL = URL(string: "animeclip.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }

}


//Extension
extension WatchNowVC: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
