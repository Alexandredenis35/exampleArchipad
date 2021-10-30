//
//  ProjectModel.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import Foundation
struct ProjectModel: Decodable {
  let projects: [Project]
}

struct Project: Decodable {
  let name: String
}
