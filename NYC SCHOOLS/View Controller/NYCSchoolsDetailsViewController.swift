//
//  NYCSchoolsDetailsViewController.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation
import UIKit

class NYCSchoolsDetailsViewController: UIViewController {
    
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    
    private let detailViewModel = NYCSchoolsDetailsViewModel()
    var selectdSchool = ""
    let scoreUnavailable = "Score Unavailable"
    let screenTitle = "SCHOOL DETAILS"
    
    override func viewDidLoad() {
        detailViewModel.delegate = self
        detailViewModel.fetchSchoolDetails()
        detailViewModel.selectdSchool = selectdSchool
        self.title = screenTitle
    }
}

extension NYCSchoolsDetailsViewController: NYCSchoolsDetailsVMDelegate {
    func didRecieveDataUpdate(data: [SchoolDetails]) {
        
        DispatchQueue.main.async {
            for item in self.detailViewModel.schools {
                if item.schoolName.lowercased() == self.selectdSchool.lowercased() {
                    self.mathScoreLabel.text = item.satMathAvgScore
                    self.readingScoreLabel.text = item.satCriticalReadingAvgScore
                    self.writingScoreLabel.text = item.satWritingAvgScore
                }
            }
        }
    }
}
