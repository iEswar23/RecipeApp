//
//  RecipeListView.swift
//  Recipe App
//
//  Created by Bharath Kumar Potham Shetti on 5/28/25.
//

import Foundation
import SwiftUI
struct RecipeListView: View {
    @StateObject private var viewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            Group {
                if let error = viewModel.errorMessage {
                    Text(error).multilineTextAlignment(.center)
                } else if viewModel.recipes.isEmpty {
                    Text("No recipes available.")
                } else {
                    List(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            HStack {
                                AsyncImage(url: recipe.photo_url_small) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                                VStack(alignment: .leading) {
                                    Text(recipe.name).bold()
                                    Text(recipe.cuisine).font(.subheadline).foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.fetchRecipes()
            }
            .refreshable {
                await viewModel.fetchRecipes()
            }
        }
    }
}
