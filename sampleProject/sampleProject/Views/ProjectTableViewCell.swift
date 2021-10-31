//
//  ProjectTableViewCell.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet var collectionView: UICollectionView!
    
    
    private var viewModel: ProjectViewModel = ProjectViewModel()
    private var collectionViewCells: [Project] = []
    weak var cellDelegate: ProjectCollectionViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register the xib for collection view cell
       
        let cellNib = UINib(nibName: "ProjectCollectionViewCell", bundle: nil)
        self.collectionView.register(cellNib, forCellWithReuseIdentifier: "ProjectCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 350, height: 400)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 2, bottom: 10, right: 2)
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.minimumLineSpacing = 20
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
       
    }
    
    public func setup(delegate: ProjectCollectionViewCellDelegate?,
                      projects: [Project]) {
        cellDelegate = delegate
        collectionViewCells = projects
        self.collectionView.reloadData()
    }
}

extension ProjectTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("section => \(section) => \(collectionViewCells.count)")
        return collectionViewCells.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("index => \(indexPath.section)")
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as? ProjectCollectionViewCell else { return UICollectionViewCell() }
        let imageName = collectionViewCells[indexPath.row].id
        let title = collectionViewCells[indexPath.row].name
        let timestamp = collectionViewCells[indexPath.row].lastModificationDate
        let image: UIImage? = UIImage(named: imageName)
        cell.setupCell(delegate: cellDelegate, image: image, title: title, timestamp: timestamp)
        return cell
    }
    
    
}
