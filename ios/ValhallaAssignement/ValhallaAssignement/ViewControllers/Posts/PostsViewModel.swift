//
//  PostsDatasource.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit

protocol PostsViewModelDelegate: ViewModelDelegate {
    func onPostsLoaded(posts: [Post]?, error: Error?)
}

class PostsViewModel: ViewModel {
    private var posts: [Post] = []
    private let repository: PostRepository = PostRepositoryImpl(remoteDatasource: PostRemoteDatasourceImpl())
    var delegate: PostsViewModelDelegate?
    
    func loadPosts() {
        self.delegate?.onState(state: .busy)
        repository.getPosts() { resPosts, err in
            if (resPosts != nil) {
                self.posts = resPosts ?? []
            }
            else {
                self.runInMain() {
                    self.delegate?.onState(state: .error)
                }
            }
            self.runInMain() {
                self.delegate?.onPostsLoaded(posts: self.posts, error: err)
                self.delegate?.onState(state: .idle)
            }
        }
    }
    
    func getPostAtIndex(index: Int) -> Post? {
        if (self.posts[index] != nil){
            return self.posts[index]
        }
        return nil
    }
}

extension PostsViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID) as? PostCell
        cell?.setContent(post: self.posts[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
}


