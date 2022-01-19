//
//  CommentCell.swift
//  ValhallaAssignement
//
//  Created by John Freidrich Cinco on 1/19/22.
//

import Foundation
import UIKit

class CommentCell: UITableViewCell {
    static let reuseID: String = "CommentCell"
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    
    var comment: Comment!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setContent(comment: Comment) {
        self.comment = comment
        self.lblName.text = self.comment.name
        self.lblEmail.text = self.comment.email
        self.lblComment.text = self.comment.body
        
    }
}
