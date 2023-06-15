//
//  SearchView.swift
//  MovieDB API
//
//  Created by Sai Krishna Dondeti on 6/14/23.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var serviceLayer: ServiceLayer
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.secondary)
                    .padding(.leading, 8)
                
                TextField("Enter Search Text" , text: $searchText)
                    .padding(10)
                    .font(.headline)
                if !searchText.isEmpty {
                    Button(action: {
                        $searchText.wrappedValue = " "
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .padding(.trailing, 8)
                    }
                }
            }
            .background(Color.gray.opacity(0.4))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.secondary, lineWidth: 0.8))
            .frame(height: 40)
            .cornerRadius(15)
            Button("Go") {
                serviceLayer.loadDataValues(searchText: searchText)
            }
        }
        .padding()
        
    }
}


struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: "enter data", serviceLayer: ServiceLayer())
    }
}
