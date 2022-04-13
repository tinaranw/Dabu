//
//  BookmarkVC.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 05/04/22.
//

import UIKit

class BookmarkVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var bookmarkTable:UITableView!
    
    private var selectedClipTitle = ""
    private var selectedClipThumbnail = ""
    
    var bookmark_anime_list:[Anime]=[
        Anime(image: "komi-san-wa-comyushou-desu-2nd-season", title: "Komi-san wa, Comyushou desu. 2nd Season",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "detective-conan", title: "Detective Conan",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 2")]),
        Anime(image: "One-piece", title: "One Piece",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 3")]),
        Anime(image: "super-psycho-love", title: "Super Psycho Love",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 4")]),
        Anime(image: "kaguya-sama-wa-kokurasetai-ultra-romantic", title: "Kaguya-sama wa Kokurasetai: Ultra Romantic",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 5")]),
        Anime(image: "chiikawa", title: "Chiikawa",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 6")]),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        //round profile pic
        self.title = "Bookmark"
        bookmarkTable.dataSource = self
        bookmarkTable.delegate = self
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmark_anime_list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookmarkAnimeClip = bookmark_anime_list[indexPath.row]
        let cell = bookmarkTable.dequeueReusableCell(withIdentifier: "bookmarkCell", for: indexPath) as! BookmarkTableViewCell
        cell.bookmarkAnimeClipTitle.text = bookmarkAnimeClip.title
        cell.bookmarkAnimeClipThumbnail.image = UIImage(named:bookmarkAnimeClip.image)
        cell.bookmarkAnimeClipThumbnail.layer.cornerRadius=10.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "animeClipDetailStoryboard") as? AnimeClipDetailViewController{
            selectedClipTitle = bookmark_anime_list[indexPath.item].title
            selectedClipThumbnail = bookmark_anime_list[indexPath.item].image
            vc.clip_title = selectedClipTitle
            vc.clip_thumbnail = selectedClipThumbnail
            show(vc, sender: self)
        }
    }
    
    
    

}
