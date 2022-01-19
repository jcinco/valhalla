//
//  PostDetailViewModel.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit

protocol PostDetailViewModelDelegate: ViewModelDelegate {
    func onCommentsLoaded(comments: [Comment]?, error: Error?)
}

class PostDetailViewModel: ViewModel {
    fileprivate var comments: [Comment] = []
    private var repository: PostRepository = PostRepositoryImpl(remoteDatasource: PostRemoteDatasourceImpl())
    var delegate: PostDetailViewModelDelegate?
    
    func loadComments(postId: Int) {
        self.delegate?.onState(state: .busy)
        repository.getComments(postId: postId) { resComments, err in
            if (resComments != nil) {
                self.comments = resComments ?? []
            }
            else {
                self.runInMain() {
                    self.delegate?.onState(state: .error)
                }
            }
            self.runInMain() {
                self.delegate?.onCommentsLoaded(comments: self.comments, error: err)
                self.delegate?.onState(state: .idle)
            }
        }
    }
}

extension PostDetailViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentCell.reuseID) as! CommentCell
        cell.setContent(comment: self.comments[indexPath.row])
        return cell
    }
}
