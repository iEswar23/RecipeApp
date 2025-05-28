//
//  RecipeViewModel.swift
//  Recipe App
//
//  Created by Bharath Kumar Potham Shetti on 5/28/25.
//

import Foundation
@MainActor
class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var errorMessage: String?

    func fetchRecipes(from urlString: String = "https://raw.githubusercontent.com/ibharathkumarp/recipe-images/refs/heads/main/RecipesLists.json") async {
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([String: [Recipe]].self, from: data)
            if let fetched = decoded["recipes"], !fetched.isEmpty {
                recipes = fetched
            } else {
                errorMessage = "No recipes available."
                recipes = []
            }
        } catch {
            errorMessage = "Failed to load recipes: \(error.localizedDescription)"
            recipes = []
        }
    }
}
