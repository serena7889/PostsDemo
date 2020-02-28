//
//  PostCell.swift
//  PostsDemo
//
//  Created by Serena Lambert on 2/28/20.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var userIDLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpView(post: Post) {
        idLbl.text = "#\(post.id)"
        userIDLbl.text = "User \(post.userID)"
        titleLbl.text = post.title
        bodyLbl.text = post.body
    }

}
