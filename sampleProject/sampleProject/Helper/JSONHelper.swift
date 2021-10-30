//
//  JSONHelper.swift
//  sampleProject
//
//  Created by Alexandre DENIS on 30/10/2021.
//

import Foundation

enum JSONHelper {
    
    public static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                print("JSONDATA => \(jsonData)")
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    public static func parse(jsonData: Data) {
        do {
            let decodedData: ProjectModel = try JSONDecoder().decode(ProjectModel.self,
                                                       from: jsonData)
            
            print("JSONDATA =>\(decodedData.result)")

        } catch {
            print("decode \(error)")
        }
    }
}
