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
    var clips = [Clips]()
    
    init(image: String, title: String, clips: [Clips]){
        self.image = image
        self.title = title
        self.clips = clips
    }
}
