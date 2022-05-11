//
//  NYCSchoolsCustomCell.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation
import UIKit

class NYCSchoolsCustomCell: UITableViewCell {
    
    func setCell(cell: UITableViewCell) {
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = AccessoryType.disclosureIndicator
    }
}
