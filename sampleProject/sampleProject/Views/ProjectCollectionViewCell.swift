//
//  ProjectCollectionViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

protocol ProjectCollectionViewCellDelegate: AnyObject {
    func showAlert()
}

class ProjectCollectionViewCell: UICollectionViewCell {
   
    // MARK: IBOutlets

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var lastModificationDate: UILabel!
    @IBOutlet private var bottomView: UIView!
    
    // MARK: Private properties

    private weak var cellDelegate: ProjectCollectionViewCellDelegate?
    
    // MARK: Public setup

    public func setupCell(delegate: ProjectCollectionViewCellDelegate?,
                          image: UIImage?,
                          title: String,
                          timestamp: TimeInterval) {
        if let img = image {
            imageView.image = img

        }
        cellDelegate = delegate
        lastModificationDate.text = "\(Date(timeIntervalSince1970: timestamp))"
        titleLabel.text = title
    }
    
    // MARK: IBAction

    @IBAction private func cardTouched() {
        cellDelegate?.showAlert()
    }
}
