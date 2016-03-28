//
//  Subreddit.swift
//  SubReddit_Posts
//
//  Created by Pierre on 3/28/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import Foundation

class Subreddit {
    
    static let kTitle = "title"
    
    var title: String?
    
    
    //Dictionary to Class
    init?(jsonDictionary: [String:String]) {
        self.title = jsonDictionary[Subreddit.kTitle]
    }
    
}