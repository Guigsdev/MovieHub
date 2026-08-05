//
//  TMDBClient.swift
//  MovieHub
//
//  Created by Guillaume Afanou Souare on 02/08/2026.
//

import Foundation

struct TMDBClient {
    private let session: URLSession
    private let token: String
    
    init(session: URLSession, token: String) {
        self.session = session
        self.token = token
    }
    
    func request<Response: Decodable>(
        _ endpoint: TMDBEndpoint,
        as type: Response.Type = Response.self
    ) async throws -> Response {
        guard let url = endpoint.url else {
            throw TMDBClientError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(
            "Bearer \(token)",
            forHTTPHeaderField: "Authorization"
        )
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )

        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw TMDBClientError.invalidResponse
        }

        guard 200..<300 ~= httpResponse.statusCode else {
            throw TMDBClientError.httpError(
                statusCode: httpResponse.statusCode
            )
        }

        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw TMDBClientError.decodingFailed(error)
        }
    }
}
