//
//  ProjectCollectionViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

protocol ProjectCollectionViewCellDelegate: AnyObject {
    func showAlert()
    func launchSync()
}

class ProjectCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var lastModificationDate: UILabel!
    weak var cellDelegate: ProjectCollectionViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupCell(delegate: ProjectCollectionViewCellDelegate?,
                          image: UIImage?,
                          title: String,
                          timestamp: TimeInterval) {
        if let img = image {
            imageView.image = img

        }
       cellDelegate = delegate
        lastModificationDate.text = "\(Date(timeIntervalSince1970: timestamp))"
        print("title => \(title)")
        titleLabel.text = title
    }
    
    
    @IBAction private func cardTouched() {
        cellDelegate?.showAlert()
    }
    
    @IBAction func syncTouched() {
        
    }
}
