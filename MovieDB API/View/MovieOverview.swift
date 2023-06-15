//
//  MovieOverview.swift
//  MovieDB API
//
//  Created by Sai Krishna Dondeti on 6/14/23.
//

import SwiftUI

struct MovieOverview: View {
    var movie:Movie
    var body: some View {
        ScrollView{
            Text(movie.title)
                .font(.headline)
            Text("Release Date: \(movie.formatDate)")
                .font(.subheadline)
                .foregroundColor(.gray)
            AsyncImage(url: movie.imageURL)
            Text(movie.overview)
        }
        .padding()
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.white,for: .navigationBar)
    }
}

struct MovieOverview_Previews: PreviewProvider {
    static var previews: some View {
        MovieOverview(movie: Movie(title: "324", releaseDate: "345", overview: "42323", posterPath: "23423"))
    }
}
