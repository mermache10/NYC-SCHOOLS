//
//  NYCSchoolsViewController.swift
//  NYC SCHOOLS
//
//  Created by Abderrahim Mermache on 5/10/22.
//

import UIKit

class NYCSchoolsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let viewModel = NYCSchoolsViewModel()
    private let detailViewModel = NYCSchoolsDetailsViewModel()
    private var schoolList = [Schools]()
    let cellID = "nycCell"
    let headerID = "header"
    let headerTitle = "NYC SCHOOLS"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpiner()
        viewModel.delegate = self
        viewModel.fetchSchools()
        registerTableViewCells()
        self.title = headerTitle
    }
    
    func registerTableViewCells() {
        tableView.register(NYCSchoolsCustomCell.self, forCellReuseIdentifier: cellID)
        tableView.register(NYCSchoolsCustomHeader.self, forHeaderFooterViewReuseIdentifier: headerID)
    }
}

extension NYCSchoolsViewController: NYCSchoolsViewModelDelegate {
    func didRecieveDataUpdate(data: [Schools]) {
        
        DispatchQueue.main.async {
            self.schoolList = data
            self.tableView.reloadData()
            self.removeSpiner()
        }
    }
}

extension NYCSchoolsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        schoolList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as? NYCSchoolsCustomCell {
            cell.textLabel?.text = schoolList[indexPath.row].schoolName
            cell.setCell(cell: cell)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? NYCSchoolsCustomHeader
        header?.apply(text: headerTitle)
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailVC") as! NYCSchoolsDetailsViewController
        if let indexPath = tableView.indexPathForSelectedRow { (tableView.cellForRow(at: indexPath))! as UITableViewCell
            
            let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
            if let currentCell = currentCell.textLabel?.text {
                detailVC.selectdSchool = currentCell
            }
        }
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
