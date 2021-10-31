//
//  ProjectViewModel.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 31/10/2021.
//

import Foundation
import UIKit

class ProjectViewModel {
    
    private enum Constants {
        static let firstHeader: String = "Projects already downloaded - allow you to work without internet connection"
        static let secondHeader: String = "Projects in the Cloud - must be downloaded while connected to the internet before use"
    }
    
    var tableViewCells: [TableViewCellModel] = []
    init() {
        if let data = JSONHelper.readLocalFile(forName: "projectdata") {
            
            let projects: [Project] = JSONHelper.parse(jsonData: data)
            let cloudProjects =  projects.filter { project in
                UIImage(named: project.id) == nil
            }
            
            let syncProjects = projects.filter { project in
                UIImage(named: project.id) != nil
            }
            tableViewCells = [TableViewCellModel(category: Constants.firstHeader,
                                                 collectionViewCells: syncProjects),
                              TableViewCellModel(category: Constants.secondHeader,
                                                 collectionViewCells: cloudProjects)]
        }
    }
}
