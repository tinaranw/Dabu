//
//  SearchVC.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 05/04/22.
//

import UIKit

class SearchVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    private var selectedAnimeTitle = ""
    private var selectedAnimeThumbnail = ""
    private var selectedAnimeSynopsis = ""
    private var selectedAnimeRating = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //round profile pic
        self.title = "Search"
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "searchResultStoryboard") as? SearchResultViewController{
            show(vc, sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView.viewWithTag(2){
                return anime_lists.count
            }else{
                return top_animes.count
            }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if collectionView == collectionView.viewWithTag(2){
            if let vc = storyboard?.instantiateViewController(withIdentifier: "animeDetailStoryboard") as? AnimeDetailViewController{
                //print(anime_lists[indexPath.item].title)
                selectedAnimeTitle = anime_lists[indexPath.item].title
                selectedAnimeThumbnail = anime_lists[indexPath.item].image
                selectedAnimeSynopsis = anime_lists[indexPath.item].synopsis
                selectedAnimeRating = Double(Float(anime_lists[indexPath.item].rating))
                vc.anime_title = selectedAnimeTitle
                vc.anime_thumbnail = selectedAnimeThumbnail
                vc.anime_synopsis = selectedAnimeSynopsis
                vc.anime_rating = Float(selectedAnimeRating)
                show(vc, sender: self)
            }
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "animeDetailStoryboard") as? AnimeDetailViewController{
                //print(anime_lists[indexPath.item].title)
                selectedAnimeTitle = top_animes[indexPath.item].title
                selectedAnimeThumbnail = top_animes[indexPath.item].image
                selectedAnimeSynopsis = top_animes[indexPath.item].synopsis
                selectedAnimeRating = Double(Float(top_animes[indexPath.item].rating))
                vc.anime_title = selectedAnimeTitle
                vc.anime_thumbnail = selectedAnimeThumbnail
                vc.anime_synopsis = selectedAnimeSynopsis
                vc.anime_rating = Float(selectedAnimeRating)
                show(vc, sender: self)
            }
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
  
        if collectionView == collectionView.viewWithTag(2){
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animeListCell", for: indexPath) as! AnimeListCollectionCell
                let anime_list = anime_lists[indexPath.row]
                cell.myAnimeListThumbnail.image = UIImage(named: anime_list.image)
                cell.myAnimeListTitle.text = anime_list.title
                cell.myAnimeListThumbnail.layer.cornerRadius=10.0
               
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topAnimeCell", for: indexPath) as! TopAnimeCollectionCell
                let top_anime = top_animes[indexPath.row]
                cell.myTopAnimeThumbnails.image = UIImage(named: top_anime.image)
                cell.myTopAnimeTitle.text = top_anime.title
                cell.myTopAnimeThumbnails.layer.cornerRadius=10.0
                return cell
            }

    }
//    var topAnimeThumbnails:[String]=["ghibli1", "ghibli2", "ghibli3"]
    
    var top_animes:[Anime]=[
        Anime(image: "kimetsu-no-yaiba", title: "Kimetsu no Yaiba", synopsis: "A boy raised by boars, who wears a boar's head, boards the Infinity Train on a new mission with the Flame Pillar along with another boy who reveals his true power when he sleeps. Their mission is to defeat a demon who has been tormenting people and killing the demon slayers who oppose it.",rating:9.8, progress: 79, clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "blackrock-shooter-dawn-fall", title: "Black★★Rock Shooter: Dawn Fall", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 79,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "tate-no-yuusha-no-nariagari-2nd-season", title: "Tate no Yuusha no Nariagari Season 2", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 79,   clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "spy-x-family", title: "Spy x Family", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 79,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
    ]
    
    var anime_lists:[Anime]=[
        Anime(image: "komi-san-wa-comyushou-desu-2nd-season", title: "Komi-san wa, Comyushou desu. 2nd Season", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 79, clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "detective-conan", title: "Detective Conan", synopsis: "Shinichi Kudou, a high school student of astounding talent in detective work, is well known for having solved several challenging cases. One day, when Shinichi spots two suspicious men and decides to follow them, he inadvertently becomes witness to a disturbing illegal activity. Unfortunately, he is caught in the act, so the men dose him with an experimental drug formulated by their criminal organization, leaving him to his death. However, to his own astonishment, Shinichi lives to see another day, but now in the body of a seven-year-old child.",rating:8.16, progress: 88,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 2")]),
        Anime(image: "One-piece", title: "One Piece", synopsis: "Gol D. Roger was known as the 'Pirate King,' the strongest and most infamous being to have sailed the Grand Line. The capture and execution of Roger by the World Government brought a change throughout the world. His last words before his death revealed the existence of the greatest treasure in the world, One Piece. It was this revelation that brought about the Grand Age of Pirates, men who dreamed of finding One Piece—which promises an unlimited amount of riches and fame—and quite possibly the pinnacle of glory and the title of the Pirate King.",rating:8.63, progress: 87,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 3")]),
        Anime(image: "super-psycho-love", title: "Super Psycho Love", synopsis: "Hitohito Tadano is an ordinary boy who heads into his first day of high school with a clear plan: to avoid trouble and do his best to blend in with others. Unfortunately, he fails right away when he takes the seat beside the school's madonna—Shouko Komi. His peers now recognize him as someone to eliminate for a chance to sit next to the most beautiful girl in class. Gorgeous and graceful with long, dark hair, Komi is universally adored and immensely popular despite her mysterious persona. However, unbeknownst to everyone, she has crippling anxiety and a communication disorder which prevents her from wholeheartedly socializing with her classmates.When left alone in the classroom, a chain of events forces Komi to interact with Tadano through writing on the blackboard, as if in a one-way conversation. Being the first person to realize she cannot communicate properly, Tadano picks up the chalk and begins to write as well. He eventually discovers that Komi's goal is to make one hundred friends during her time in high school. To this end, he decides to lend her a helping hand, thus also becoming her first-ever friend.",rating:9.8, progress: 55,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 4")]),
        Anime(image: "kaguya-sama-wa-kokurasetai-ultra-romantic", title: "Kaguya-sama wa Kokurasetai: Ultra Romantic", synopsis: "Third season of Kaguya-sama wa Kokurasetai: Tensai-tachi no Renai Zunousen.",rating:9.0, progress: 79,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 5")]),
        Anime(image: "chiikawa", title: "Chiikawa", synopsis: "No synopsis information has been added to this title. Help improve our database by adding a synopsis here.",rating:7.63, progress: 88,  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 6")]),
    ]
    
}
