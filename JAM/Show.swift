//
//  Show.swift
//  JAM
//
//  Created by Lucien on 5/18/17.
//  Copyright © 2017 Lucien. All rights reserved.
//

import Foundation

class Show: NSObject {
    var img: String?
    var name: String?
    var genre: String?
    var location: String?
    var time: String?
    var distance: String?
    var vid: String?
    
    init(img: String?, name: String?, genre: String?, location: String?, time: String?, distance: String?, desc: String?){
        self.img = img
        self.name = name
        self.genre = genre
        self.location = location
        self.time = time
        self.distance = distance
        self.vid = desc
    }
}
