//
//  ViewController.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var projectTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let data = JSONHelper.readLocalFile(forName: "projectdata") {
            JSONHelper.parse(jsonData: data)

        }
        
       
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

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell") as? ProjectTableViewCell else {
            return UITableViewCell()
    }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProjectHeaderTableViewCell") as? ProjectHeaderTableViewCell else {
            return UIView()
        }
    //headerView.sectionTitleLabel.text = "TableView Heder \(section)"
    return headerView
    }
    
}
