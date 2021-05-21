//
//  Video.swift
//  Youtube Clone
//
//  Created by MacBook on 22/03/21.
//

import Foundation

struct Video : Decodable{
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourseId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail
        case videoId
    }
    // Penjabaran
    
    init(from decoder : Decoder) throws {
        let container = try
            decoder.container(keyedBy:CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey :.snippet)
        
        //parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        //parse description
        self.title = try snippetContainer.decode(String.self, forKey: .description)
        
        //parse published
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnail)
        
        let highContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse VideoId
        let resourseIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourseId)
        
        self.videoId = try resourseIdContainer.decode(String.self, forKey: .videoId)
    }
}
