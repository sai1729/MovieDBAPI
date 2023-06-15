//
//  Welcome.swift
//  MovieDB API
//
//  Created by Sai Krishna Dondeti on 6/14/23.
//

import Foundation
import UIKit


struct Movie: Codable, Identifiable,Hashable {
    let id: String = UUID().uuidString
    let title: String
    var releaseDate: String
    let overview: String
    let posterPath: String?
    var voteAverage: Double?
    var imageURL: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w300" + (posterPath ?? ""))
    }

    var formattedReleaseDate: String {
             let dateFormatter = DateFormatter()
             dateFormatter.dateFormat = "yyyy-MM-dd"
             if let date = dateFormatter.date(from: releaseDate) {
                 dateFormatter.dateFormat = "MMMM dd, yyyy"
                 return dateFormatter.string(from: date)
             }
         return ""
     }
    
    var formatDate :String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let date = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "MM/dd/yy"
            return dateFormatter.string(from: date)
        }
    return ""
    }
    
    enum  CodingKeys:String, CodingKey {
        case id,title,overview
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
}

struct MovieResponse: Codable {
    let results: [Movie]
}
