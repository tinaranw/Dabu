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
                vc.anime_title = selectedAnimeTitle
                vc.anime_thumbnail = selectedAnimeThumbnail
                show(vc, sender: self)
            }
        } else {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "animeDetailStoryboard") as? AnimeDetailViewController{
                //print(anime_lists[indexPath.item].title)
                selectedAnimeTitle = top_animes[indexPath.item].title
                selectedAnimeThumbnail = top_animes[indexPath.item].image
                vc.anime_title = selectedAnimeTitle
                vc.anime_thumbnail = selectedAnimeThumbnail
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
        Anime(image: "kimetsu-no-yaiba", title: "Kimetsu no Yaiba", clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "blackrock-shooter-dawn-fall", title: "Black★★Rock Shooter: Dawn Fall", clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "tate-no-yuusha-no-nariagari-2nd-season", title: "Tate no Yuusha no Nariagari Season 2",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "spy-x-family", title: "Spy x Family", clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
    ]
    
    var anime_lists:[Anime]=[
        Anime(image: "komi-san-wa-comyushou-desu-2nd-season", title: "Komi-san wa, Comyushou desu. 2nd Season",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "detective-conan", title: "Detective Conan",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "One-piece", title: "One Piece",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "super-psycho-love", title: "Super Psycho Love",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "kaguya-sama-wa-kokurasetai-ultra-romantic", title: "Kaguya-sama wa Kokurasetai: Ultra Romantic",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
        Anime(image: "chiikawa", title: "Chiikawa",  clips: [Clips(image: "blackrock-shooter-dawn-fall", title: "Clip 1")]),
    ]
    
}
