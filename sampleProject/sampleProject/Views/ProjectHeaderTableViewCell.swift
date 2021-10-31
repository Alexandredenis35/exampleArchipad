//
//  ProjectHeaderTableViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ProjectHeaderTableViewCell: UITableViewHeaderFooterView {
    @IBOutlet private var headerLabel: UILabel!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    public func setupHeader(title: String) {
        headerLabel.text = title
    }

}
