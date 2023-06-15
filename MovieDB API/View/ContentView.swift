//
//  ContentView.swift
//  MovieDB API
//
//  Created by Sai Krishna Dondeti on 6/14/23.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @ObservedObject private var serviceLayer = ServiceLayer()

    var body: some View {
        ZStack{
            VStack{
                SearchView(searchText: searchText, serviceLayer: serviceLayer)
                if serviceLayer.movies.count < 1 {
                    Text("Enter value to search")
                } else {
                    List(serviceLayer.movies,id: \.self){ movie in
                        NavigationLink {
                            MovieOverview(movie: movie)
                        } label: {
                            RowDesign(movie: movie)
                        }
                    }
                    .listStyle(.plain)
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .navigationBarTitle("Movie Search", displayMode: .inline)
        .toolbarBackground(Color.blue,for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
