//
//  DogViewModel.swift
//  DogApp
//
//  Created by Eman Tayyab on 06/10/2026.
//

import Foundation
import Combine
@MainActor
final class DogViewModel: ObservableObject {
    
    @Published var imageURL: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let service = DogService()
    
    func loadDog() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            
            let dog = try await service.fetchDog()
            imageURL = dog.message
            
        } catch {
            
            errorMessage = error.localizedDescription
            print("Error:", error)
            
        }
        
        isLoading = false
        
    }
    
    
}
