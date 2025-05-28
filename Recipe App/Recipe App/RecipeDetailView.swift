//
//  RecipeDetailView.swift
//  Recipe App
//
//  Created by Bharath Kumar Potham Shetti on 5/28/25.
//

import Foundation
import SwiftUI
struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let photoURL = recipe.photo_url_large {
                    AsyncImage(url: photoURL) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 300)
                    .cornerRadius(10)
                }

                Text(recipe.name).font(.title)
                Text("Cuisine: \(recipe.cuisine)").font(.subheadline)

                if let source = recipe.source_url {
                    Link("View Source", destination: source)
                }
                if let youtube = recipe.youtube_url {
                    Link("Watch on YouTube", destination: youtube)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
