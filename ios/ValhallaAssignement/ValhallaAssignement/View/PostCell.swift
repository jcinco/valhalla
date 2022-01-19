//
//  PostCell.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit


class PostCell: UITableViewCell {
    static let reuseID: String = "PostCell"
    var post: Post!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
  
    
    func setContent(post: Post) {
        self.post = post
        self.lblTitle.text = self.post.title
        self.lblBody.text = self.post.body
    }
}
