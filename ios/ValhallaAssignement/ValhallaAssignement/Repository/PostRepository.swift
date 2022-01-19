//
//  PostRepository.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation


protocol PostRepository {
    func getPosts(onResult: @escaping ([Post]?, Error?) -> Void)
    func getComments(postId: Int, onResult: @escaping ([Comment]?, Error?) -> Void)
}
