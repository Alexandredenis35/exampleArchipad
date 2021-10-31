//
//  ViewController.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var projectTableView: UITableView!
    private var viewModel: ProjectViewModel = ProjectViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }

    private func setupTableView() {
        // Register the xib for tableview cell
        
        let headerCellNib = UINib(nibName: "ProjectHeaderTableViewCell", bundle: nil)
        let cellNib = UINib(nibName: "ProjectTableViewCell", bundle: nil)
        self.projectTableView.register(cellNib, forCellReuseIdentifier: "ProjectTableViewCell")

        self.projectTableView.register(headerCellNib, forHeaderFooterViewReuseIdentifier: "ProjectHeaderTableViewCell")
        self.projectTableView.register(cellNib, forCellReuseIdentifier: "ProjectTableViewCell")
        projectTableView.delegate = self
        projectTableView.dataSource = self
    }
    
    private func showAlertProject() {
        let alert = UIAlertController(title: "Détails du projet", message: "Voici le détails du projet", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.tableViewCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell") as? ProjectTableViewCell else {
            return UITableViewCell()
    }
        let projects = viewModel.tableViewCells[indexPath.section].collectionViewCells
        cell.setup(delegate: self, projects: projects)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProjectHeaderTableViewCell") as? ProjectHeaderTableViewCell else {
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
