//
//  NYCSchoolsCustomHeader.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import Foundation
import UIKit

class NYCSchoolsCustomHeader: UITableViewHeaderFooterView {
    let label = UILabel(frame: .zero)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        let customBackgroundView = UIView(frame: .zero)
        customBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        customBackgroundView.backgroundColor = .green
        
        contentView.addSubview(customBackgroundView)
        customBackgroundView.addSubview(label)
        
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: customBackgroundView.leadingAnchor, constant: 16.0),
            label.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: -16.0),
            label.topAnchor.constraint(equalTo: customBackgroundView.topAnchor),
            label.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor),
            
            customBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor ),
            customBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func apply(text: String) {
        label.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
