//
//  NYCServiceManager.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation

enum SchoolsFetcherError: Error {
    case invalidURL
    case missingData
}

struct NYCServiceManager {
    
    static func fetchSchools() async throws -> [Schools] {
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else {
            throw SchoolsFetcherError.invalidURL
        }
        
        // Use the async variant of URLSession to fetch data
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Parse the JSON data
        let result = try JSONDecoder().decode([Schools].self, from: data)
        return result
    }
    
    static func fetchSchoolDetails() async throws -> [SchoolDetails] {
        
        guard let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
            throw SchoolsFetcherError.invalidURL
        }
        
        // Use the async variant of URLSession to fetch data
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Parse the JSON data
        let result = try JSONDecoder().decode([SchoolDetails].self, from: data)
        return result
    }
}
