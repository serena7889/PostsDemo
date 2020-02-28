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
    
    var posts = [Post]()
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        view.addSubview(activityIndicatorView)
        tableView.isHidden = true
        activityIndicatorView.isHidden = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        displayPosts()
    }
    
    func displayPosts() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                if let decodedPosts = try? JSONDecoder().decode([Post].self, from: data) {
                    self.posts = decodedPosts
                    DispatchQueue.main.async {
                        self.activityIndicatorView.stopAnimating()
                        self.activityIndicatorView.isHidden = true
                        self.tableView.reloadData()
                        self.tableView.isHidden = false
                    }
                } else {
                   debugPrint("Failure to decode posts.")
               }
            } else {
                debugPrint("Failure to get data.")
            }
        }.resume()
        
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

