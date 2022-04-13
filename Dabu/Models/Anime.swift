//
//  Anime.swift
//  Dabu
//
//  Created by Tinara Nathania Wiryonoputro on 06/04/22.
//

import Foundation
struct Anime {
    var image:String = ""
    var title:String = ""
    var synopsis:String = ""
    var rating:Float = 0.0
    var progress:Int = 0
    var clips = [Clips]()
    
    init(image: String, title: String, synopsis:String, rating:Float, progress:Int, clips: [Clips]){
        self.image = image
        self.title = title
        self.clips = clips
        self.synopsis = synopsis
        self.rating = rating
        self.progress = progress
    }
}
