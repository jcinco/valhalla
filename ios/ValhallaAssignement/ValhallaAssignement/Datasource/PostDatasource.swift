//
//  PostRemoteDatasource.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation

protocol PostDatasource: DataSource {
    func getPosts(onResult: @escaping ([Post]?, Error?) -> Void)
    func getComments(postId: Int, onResult: @escaping ([Comment]?, Error?) -> Void)
}


class PostRemoteDatasourceImpl: PostDatasource {
    private let baseUrl: String = "https://jsonplaceholder.typicode.com"
    func getPosts(onResult: @escaping ([Post]?, Error?) -> Void) {
        let path = "\(baseUrl)/posts"
        LMHttpJsonGET(url: URL(string: path)!)
            .execute(withCompletion: { data, res, err   in
            // Convert to posts array here.
                do {
                    if (data != nil) {
                        let posts = try JSONDecoder().decode(Array<Post>.self, from: data!)
                        onResult(posts, err)
                    }
                    else {
                        onResult(nil, err)
                    }
                }
                catch {
                    onResult([], NSError(domain: "PostRemoteDatasource`", code: -1, userInfo: ["description": "Failed to decode data"]) as Error)
                }
                
        })
        
    }
    
    func getComments(postId: Int, onResult: @escaping ([Comment]?, Error?) -> Void) {
        let path = "\(baseUrl)/posts/\(postId)/comments"
        LMHttpJsonGET(url: URL(string: path)!)
            .execute(withCompletion: { data, res, err   in
            // Convert to posts array here.
                do {
                    if (data != nil) {
                        let posts = try JSONDecoder().decode(Array<Comment>.self, from: data!)
                        onResult(posts, err)
                    }
                    else {
                        onResult(nil, err)
                    }
                }
                catch {
                    onResult([], NSError(domain: "PostRemoteDatasource`", code: -1, userInfo: ["description": "Failed to decode data"]) as Error)
                }
                
        })
    }
    
    
}
