//: Playground - noun: a place where people can play

import UIKit

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Music:MediaItem{
    var artist:String?
    init(name: String, artist:String)
    {
        self.artist = artist
        super.init(name: name)
    }
}
Music(name: "Song 2", artist: "Blur")