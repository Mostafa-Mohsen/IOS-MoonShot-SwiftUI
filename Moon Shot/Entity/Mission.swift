//
//  Mission.swift
//  Moon Shot
//
//  Created by Soft Xpert on 9/11/21.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct Crew: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let crew: [Crew]
    let description: String
    let launchDate: Date?
    
    var missionName: String {
        return "Apollo-\(id)"
    }
    
    var image: String {
        return "apollo\(id)"
    }
    
    var formattedDate: String {
        if let unwrappedDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: unwrappedDate)
        }
        return "N/A"
    }
}
