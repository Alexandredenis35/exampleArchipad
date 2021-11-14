//
//  ProjectModel.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import Foundation

struct ProjectModel: Decodable {
  let result: [Project]
}

struct Project: Decodable {
  let id: String
  let name: String
  let lastModificationDate: TimeInterval
}
