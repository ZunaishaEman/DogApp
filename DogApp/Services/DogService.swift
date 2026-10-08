//
//  DogService.swift
//  DogApp
//
//  Created by Eman Tayyab on 05/10/2026.
//

import Foundation

final class DogService {
    
    private let url = URL(string: "https://dog.ceo/api/breeds/image/random")!
    
    func fetchDog() async throws -> DogImage {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let http = response as? HTTPURLResponse, http.statusCode != 200 {
            
            print("Status:",http.statusCode)
            throw URLError(.badServerResponse)
            
        }
        
        return try JSONDecoder().decode(DogImage.self, from: data)
        
    }
}
