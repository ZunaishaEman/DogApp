//
//  DogView.swift
//  DogApp
//
//  Created by Eman Tayyab on 06/10/2026.
//

import SwiftUI

struct DogView: View {
    @StateObject private var viewModel = DogViewModel()
    var body: some View {
       
        VStack{
            
            if viewModel.isLoading {
                ProgressView()
                
            } else if let error = viewModel.errorMessage{
                Text("Error: \(error)")
                
            } else {
                AsyncImage(url: URL(string: viewModel.imageURL)) { image in image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                
            }
            
            Button("New Dog 🐶") {
                Task {
                    await viewModel.loadDog()
                    
                }
                
            }
            
        }
        .padding()
        .task {
            await viewModel.loadDog()
            
        }
        
        
    }
}

#Preview {
    DogView()
}
