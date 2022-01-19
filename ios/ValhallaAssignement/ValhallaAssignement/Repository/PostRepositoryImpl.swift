//
//  PostRepositoryImpl.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation


class PostRepositoryImpl: PostRepository {
    
    private var remoteDatasource: PostDatasource!
    
    init(remoteDatasource: PostDatasource) {
        self.remoteDatasource = remoteDatasource
    }
    
    func getPosts(onResult: @escaping ([Post]?, Error?) -> Void) {
        self.remoteDatasource.getPosts(onResult: onResult)
    }
    func getComments(postId: Int, onResult: @escaping ([Comment]?, Error?) -> Void){
        self.remoteDatasource.getComments(postId: postId, onResult: onResult)
    }
  
}
