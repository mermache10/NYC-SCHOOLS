//
//  NYCSchoolsDetailsViewModel.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation

protocol NYCSchoolsDetailsVMDelegate: AnyObject  {
    func didRecieveDataUpdate(data: [SchoolDetails])
}

class NYCSchoolsDetailsViewModel: NSObject {
    
    weak var delegate: NYCSchoolsDetailsVMDelegate?
    var schools = [SchoolDetails]()
    
    var selectdSchool = ""
    
    func fetchSchoolDetails() {
        // Start an async task
        Task {
            do {
                
                let schools = try await NYCServiceManager.fetchSchoolDetails()
                self.schools = schools
                // Update UI content
                delegate?.didRecieveDataUpdate(data: schools)
                
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }
}
