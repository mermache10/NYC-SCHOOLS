//
//  NYCActivityIndicator.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import UIKit

private var spinerView: UIView!

extension UIViewController {
    
    func showSpiner() {
        
        spinerView = UIView(frame: self.view.bounds)
        spinerView?.backgroundColor = UIColor.init(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.center = spinerView.center
        activityIndicator.startAnimating()
        spinerView.addSubview(activityIndicator)
        self.view.addSubview(spinerView)
    }
    
    func removeSpiner() {
        
        spinerView.removeFromSuperview()
        spinerView = nil
    }
}
