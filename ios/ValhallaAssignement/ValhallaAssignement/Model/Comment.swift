//
//  Comment.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation


struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
