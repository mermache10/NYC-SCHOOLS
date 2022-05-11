//
//  NYCSchoolsDataModel.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation

struct Schools: Codable {
    
    let dbn: String
    let schoolName: String
    let boro: String
    
    private enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case boro = "boro"
    }
}

struct SchoolDetails: Codable {
    
    let dbn: String
    let schoolName: String
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
    
    private enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
