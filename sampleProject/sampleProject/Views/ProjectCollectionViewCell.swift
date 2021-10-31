//
//  ProjectCollectionViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ProjectCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func setupCell(image: UIImage?, title: String) {
        if let img = image {
            imageView.image = img

        }
        print("title => \(title)")
        titleLabel.text = title
    }
}
