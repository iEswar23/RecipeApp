//
//  Recipe.swift
//  Recipe App
//
//  Created by Bharath Kumar Potham Shetti on 5/28/25.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: UUID
    let name: String
    let cuisine: String
    let photo_url_small: URL?
    let photo_url_large: URL?
    let source_url: URL?
    let youtube_url: URL?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case cuisine
        case photo_url_small
        case photo_url_large
        case source_url
        case youtube_url
    }
}
