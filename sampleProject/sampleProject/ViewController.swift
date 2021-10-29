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
        setupTableView()
    }

    private func setupTableView() {
        // Register the xib for tableview cell
        let cellNib = UINib(nibName: "ProjectTableViewCell", bundle: nil)
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
    
}
