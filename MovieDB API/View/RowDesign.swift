//
//  Row Design.swift
//  MovieDB API
//
//  Created by Sai Krishna Dondeti on 6/14/23.
//

import SwiftUI

struct RowDesign: View {
    var movie:Movie
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(movie.title)
                    .font(.headline)
                    .padding(.vertical,5)
                Text(movie.formattedReleaseDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(String(format: "%.1f", movie.voteAverage ?? 0.00))
        }

    }
}

struct Row_Design_Previews: PreviewProvider {
    static var previews: some View {
        RowDesign(movie: Movie(title: "434252", releaseDate: "#44", overview: "3452", posterPath: "535235"))
    }
}
