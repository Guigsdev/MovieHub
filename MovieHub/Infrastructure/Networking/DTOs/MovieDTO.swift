//
//  MovieDTO.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 31/07/2026.
//
import Foundation

struct MovieDTO: Decodable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

// MARK: - Extension
extension MovieDTO {
    func toDomain() -> Movie {
        return Movie(id: id,
                     title: title,
                     releaseDate: parsedReleaseDate,
                     posterURL: TMDBImageURLBuilder.posterURL(from: posterPath),
                     rating: voteAverage)
    }
    
    private var parsedReleaseDate: Date? {
        guard let releaseDate, !releaseDate.isEmpty else { return nil }
        return Self.releaseDateFormatter.date(from: releaseDate)
    }
    
    private var posterURL: URL? {
        guard let posterPath, !posterPath.isEmpty else {
            return nil
        }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
    
    private static let releaseDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
