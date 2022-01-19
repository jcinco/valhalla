//
//  PostsViewController.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit

class PostsViewController: BaseViewController, UITableViewDelegate, PostsViewModelDelegate {
    private var viewModel: PostsViewModel!
    @IBOutlet weak var tableView: UITableView! 
    
    required init?(coder aDecoder: NSCoder) {
        self.viewModel = PostsViewModel()
        super.init(coder: aDecoder)
        self.viewModel.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Posts"
        
        self.tableView.register(UINib(nibName: PostCell.reuseID, bundle: nil), forCellReuseIdentifier: PostCell.reuseID)
        self.tableView.estimatedRowHeight = 150
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = viewModel
        self.viewModel.loadPosts()
    }
    
    
    @objc func handleReloadData() {
        self.viewModel.loadPosts()
    }
    
    func onPostsLoaded(posts: [Post]?, error: Error?) {
        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
    }
    
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
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        // navigate to details vc
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as! PostDetailViewController
        vc.post = self.viewModel.getPostAtIndex(index: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


