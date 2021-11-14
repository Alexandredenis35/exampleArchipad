//
//  ProjectTableViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let itemWidthSize: Double = 350
        static let itemHeightSize: Double = 400
        static let topInset: Double = 30
        static let leftInset: Double = 2
        static let bottomInset: Double = 10
        static let rightInset: Double = 2
        static let interItemSpacing: Double = 20
        static let lineSpacing: Double = 20
        static let numberOfSections: Int = 1
        static let cellNibName: String = "ProjectCollectionViewCell"
    }
    // MARK: IBOutlets

    @IBOutlet private var collectionView: UICollectionView!
    
    // MARK: Private properties

    private var viewModel: ProjectViewModel = ProjectViewModel()
    private var collectionViewCells: [Project] = []
    private weak var cellDelegate: ProjectCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Register the xib for collection view cell
       
        let cellNib = UINib(nibName: Constants.cellNibName, bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: Constants.cellNibName)
        setupUICell()
    }
    
    // MARK: Private methods

    private func setupUICell() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: Constants.itemWidthSize, height: Constants.itemHeightSize)
        flowLayout.sectionInset = UIEdgeInsets(top: Constants.topInset,
                                               left: Constants.leftInset,
                                               bottom: Constants.bottomInset,
                                               right: Constants.rightInset)
        flowLayout.minimumInteritemSpacing = Constants.interItemSpacing
        flowLayout.minimumLineSpacing = Constants.lineSpacing
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        setupDelegate()
    }
    
    private func setupDelegate() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    // MARK: Public setup

    public func setup(delegate: ProjectCollectionViewCellDelegate?,
                      projects: [Project]) {
        cellDelegate = delegate
        collectionViewCells = projects
        self.collectionView.reloadData()
    }
}

// MARK: Extensions

extension ProjectTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCells.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.numberOfSections
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellNibName, for: indexPath) as? ProjectCollectionViewCell else {
            return UICollectionViewCell()
        }
        let imageName = collectionViewCells[indexPath.row].id
        let title = collectionViewCells[indexPath.row].name
        let timestamp = collectionViewCells[indexPath.row].lastModificationDate
        let image: UIImage? = UIImage(named: imageName)
        cell.setupCell(delegate: cellDelegate, image: image, title: title, timestamp: timestamp)
        return cell
    }
}
