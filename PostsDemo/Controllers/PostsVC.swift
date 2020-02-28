//
//  ViewController.swift
//  PostsDemo
//
//  Created by Serena Lambert on 2/28/20.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import UIKit

class PostsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [
        Post(userID: 1, id: 1, title: "Title 1", body: "Body 1"),
        Post(userID: 2, id: 2, title: "Title 2", body: "Body 2"),
        Post(userID: 3, id: 3, title: "Title 3", body: "Body 3"),
        Post(userID: 4, id: 4, title: "Title 4", body: "Body 4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension PostsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as? PostCell else { return PostCell() }
        cell.setUpView(post: posts[indexPath.row])
        return cell
    }
    
}

