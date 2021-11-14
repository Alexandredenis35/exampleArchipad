//
//  ProjectHeaderTableViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ProjectHeaderTableViewCell: UITableViewHeaderFooterView {
    
    // MARK: IBOutlet

    @IBOutlet private var headerLabel: UILabel!
    
    // MARK: Public setup

    public func setupHeader(title: String) {
        headerLabel.text = title
    }
}
