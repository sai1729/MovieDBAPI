//
//  ServiceLayer.swift
//  MovieDB API
//
//  Created by Sai Krishna Dondeti on 6/14/23.
//

import Foundation
import Combine


class ServiceLayer: ObservableObject{
    @Published var movies:[Movie] = []
    private var cancellables = Set<AnyCancellable>()
    
    func loadDataValues(searchText: String) {

        guard searchText.count > 1 else {
            return
        }

        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5MzIyZGRlZDc1NzgyOGYwODU1NTg1Zjk5OTA0ZTU5YiIsInN1YiI6IjY0OGEwNTYwNmY4ZDk1MDEzYzc1NTRmZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vWwD6pu57PRwLs6suBbz-v3uritdv9MZorA-hNo_XgQ"
        ]
        
        let urlString = "https://api.themoviedb.org/3/search/movie?query=\(searchText.replacingOccurrences(of: " ", with: "%20"))&include_adult=false&language=en-US&page=1"

        guard let url = URL(string: urlString) else {
            print("Invalid URL: \(urlString)")
            return
        }
        let request = NSMutableURLRequest(url: url)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    self.movies = response.results
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
    
}
