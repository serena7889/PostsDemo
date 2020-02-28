//
//  Post.swift
//  PostsDemo
//
//  Created by Serena Lambert on 2/28/20.
//  Copyright © 2020 Serena Lambert. All rights reserved.
//

import Foundation

struct Post: Decodable {
    var userID: Int
    var id: Int
    var title: String
    var body: String
}
