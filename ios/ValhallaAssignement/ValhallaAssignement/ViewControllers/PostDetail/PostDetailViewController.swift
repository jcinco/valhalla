//
//  PostDetail.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit


class PostDetailViewController: BaseTableViewController, PostDetailViewModelDelegate {
    private var viewModel: PostDetailViewModel!
    private var commentTableDelegate: CommentTableDelegate!
    
    var post: Post?
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var tblComments: UITableView!
    
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = PostDetailViewModel()
        super.init(coder: aDecoder)
        self.viewModel.delegate = self
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commentTableDelegate = CommentTableDelegate(viewController: self)
        self.tblComments.delegate = self.commentTableDelegate
        self.tblComments.register(UINib(nibName: CommentCell.reuseID, bundle: nil), forCellReuseIdentifier: CommentCell.reuseID)
        self.tblComments.dataSource = self.viewModel
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        
        self.lblTitle.text = self.post?.title
        self.lblBody.text = self.post?.body
        
        self.viewModel.loadComments(postId: self.post?.id ?? 0)
    }
    
    func onCommentsLoaded(comments: [Comment]?, error: Error?) {
        self.tblComments.reloadData()
        self.hideLoading()
    }
    
    func onState(state: ViewModelState) {
        func onState(state: ViewModelState) {
            switch(state) {
            case .busy:
                self.showLoading()
            case .idle:
                fallthrough
            default:
                self.hideLoading()
            }
        }
    }
    
    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row < 3) ? UITableView.automaticDimension : 500
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row < 3) ? UITableView.automaticDimension : 500
    }
    
}


class CommentTableDelegate: NSObject, UITableViewDelegate {
    private var vc: PostDetailViewController!
    
    init(viewController: PostDetailViewController) {
        self.vc = viewController
        super.init()
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
