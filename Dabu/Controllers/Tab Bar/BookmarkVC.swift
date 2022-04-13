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
    private var selectedClipProgress = 0
    
    var bookmark_anime_list:[Anime]=[
        Anime(image: "komi-san-wa-comyushou-desu-2nd-season", title: "Komi-san wa, Comyushou desu. 2nd Season", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 79, clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "detective-conan", title: "Detective Conan", synopsis: "Shinichi Kudou, a high school student of astounding talent in detective work, is well known for having solved several challenging cases. One day, when Shinichi spots two suspicious men and decides to follow them, he inadvertently becomes witness to a disturbing illegal activity. Unfortunately, he is caught in the act, so the men dose him with an experimental drug formulated by their criminal organization, leaving him to his death. However, to his own astonishment, Shinichi lives to see another day, but now in the body of a seven-year-old child.",rating:8.16, progress: 88,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 2")]),
        Anime(image: "One-piece", title: "One Piece", synopsis: "Gol D. Roger was known as the 'Pirate King,' the strongest and most infamous being to have sailed the Grand Line. The capture and execution of Roger by the World Government brought a change throughout the world. His last words before his death revealed the existence of the greatest treasure in the world, One Piece. It was this revelation that brought about the Grand Age of Pirates, men who dreamed of finding One Piece—which promises an unlimited amount of riches and fame—and quite possibly the pinnacle of glory and the title of the Pirate King.",rating:8.63, progress: 87,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 3")]),
        Anime(image: "super-psycho-love", title: "Super Psycho Love", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 55,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 4")]),
        Anime(image: "kaguya-sama-wa-kokurasetai-ultra-romantic", title: "Kaguya-sama wa Kokurasetai: Ultra Romantic", synopsis: "Third season of Kaguya-sama wa Kokurasetai: Tensai-tachi no Renai Zunousen.",rating:9.0, progress: 79,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 5")]),
        Anime(image: "chiikawa", title: "Chiikawa", synopsis: "No synopsis information has been added to this title. Help improve our database by adding a synopsis here.",rating:7.63, progress: 88,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 6")]),
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
            selectedClipProgress = bookmark_anime_list[indexPath.item].progress
            vc.clip_title = selectedClipTitle
            vc.clip_thumbnail = selectedClipThumbnail
            vc.clip_progress = selectedClipProgress
            show(vc, sender: self)
        }
    }
    
    
    

}
