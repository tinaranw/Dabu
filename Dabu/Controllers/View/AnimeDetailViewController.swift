//
//  AnimeDetailViewController.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 07/04/22.
//

import UIKit

class AnimeDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    private var selectedClipTitle = ""
    private var selectedClipThumbnail = ""
    
    
    var detail_anime_clips:[Clips]=[
        Clips(image: "tanjiro2", title: "Trainer Sakonji Urokodaki"),
        Clips(image: "tanjiro3", title: "Sabito and Makomo"),
        Clips(image: "tanjiro4", title: "Final Selection"),
        Clips(image: "tanjiro5", title: "My Own Steel"),
    ]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detail_anime_clips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailAnimeClip = detail_anime_clips[indexPath.row]
        let cell = animeClipsTable.dequeueReusableCell(withIdentifier: "animeClipCell", for: indexPath) as! AnimeDetailClipsTableViewCell
        cell.myAnimeDetailClipTitle.text = detailAnimeClip.title
        cell.myAnimeDetailClipThumbnail.image = UIImage(named:detailAnimeClip.image)
        cell.myAnimeDetailClipThumbnail.layer.cornerRadius=10.0
        return cell
    }
    
   
    @IBOutlet weak var animeClipsTable: UITableView!
    var anime_title: String = ""
    var anime_thumbnail: String = ""
    var anime_synopsis: String = ""
    var anime_rating: Float = 0.0

    @IBOutlet weak var myAnimeDetailThumbnail: UIImageView!
    @IBOutlet weak var myAnimeDetailTitle: UILabel!
    @IBOutlet weak var myAnimeDetailSynopsis: UILabel!
    @IBOutlet weak var myAnimeDetailRating: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myAnimeDetailTitle.text = anime_title
        myAnimeDetailThumbnail.image = UIImage(named: anime_thumbnail)
        myAnimeDetailSynopsis.text = anime_synopsis
        myAnimeDetailRating.text = String(anime_rating)

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "animeClipDetailStoryboard") as? AnimeClipDetailViewController{
            selectedClipTitle = detail_anime_clips[indexPath.item].title
            selectedClipThumbnail = detail_anime_clips[indexPath.item].image
            vc.clip_title = selectedClipTitle
            vc.clip_thumbnail = selectedClipThumbnail
            show(vc, sender: self)
        }
    }
    
    
    

}
