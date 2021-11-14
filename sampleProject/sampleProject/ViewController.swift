//
//  ViewController.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ViewController: UIViewController {
   
    private enum Constants {
        static let headerCellNibName: String = "ProjectHeaderTableViewCell"
        static let cellNibName: String = "ProjectTableViewCell"
        static let numberOfRowsInSection: Int = 1
    }
    // MARK: IBOutlet

    @IBOutlet private var projectTableView: UITableView!
    
    // MARK: Private Methods

    private var viewModel: ProjectViewModel = ProjectViewModel()
    
    // MARK: LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }

    // MARK: Private methods

    private func setupTableView() {
        // Register the xib for tableview cell
        let headerCellNib = UINib(nibName: Constants.headerCellNibName, bundle: nil)
        let cellNib = UINib(nibName: Constants.cellNibName, bundle: nil)
        self.projectTableView.register(cellNib, forCellReuseIdentifier: Constants.cellNibName)

        self.projectTableView.register(headerCellNib, forHeaderFooterViewReuseIdentifier: Constants.headerCellNibName)
        self.projectTableView.register(cellNib, forCellReuseIdentifier: Constants.cellNibName)
        projectTableView.delegate = self
        projectTableView.dataSource = self
    }
    
    private func showAlertProject() {
        let alert = UIAlertController(title: "Détails du projet", message: "Voici le détails du projet", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: Extension

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.numberOfRowsInSection
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.tableViewCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellNibName) as? ProjectTableViewCell else {
            return UITableViewCell()
        }
        let projects = viewModel.tableViewCells[indexPath.section].collectionViewCells
        cell.setup(delegate: self, projects: projects)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerCellNibName) as? ProjectHeaderTableViewCell else {
            return UIView()
        }
        let title: String = viewModel.tableViewCells[section].category
        headerView.setupHeader(title: title)
        return headerView
    }
    
}

extension ViewController: ProjectCollectionViewCellDelegate {
    func showAlert() {
        showAlertProject()
    }
}
