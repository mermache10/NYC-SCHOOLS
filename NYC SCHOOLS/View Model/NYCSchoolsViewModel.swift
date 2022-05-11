//
//  NYCSchoolsViewModel.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation

protocol NYCSchoolsViewModelDelegate: AnyObject  {
    func didRecieveDataUpdate(data: [Schools])
}

class NYCSchoolsViewModel: NSObject {
    
    weak var delegate: NYCSchoolsViewModelDelegate?
    
    func fetchSchools() {
        // Start an async task
        Task {
            do {
                
                let schools = try await NYCServiceManager.fetchSchools()
                
                // Update table view content
                delegate?.didRecieveDataUpdate(data: schools)
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
