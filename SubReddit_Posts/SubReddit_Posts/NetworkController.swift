//
//  NetworkController.swift
//  SubReddit_Posts
//
//  Created by Pierre on 3/28/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let baseURL = "https://www.reddit.com/subreddits/search"
    
    
    static func searchByTopic(topic: String) -> NSURL {
        return NSURL(string: "https://www.reddit.com/r\(topic).json")!
        
    }
    
    static func dataAtURL(url: NSURL, completion:(data: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            guard let data = data else {
                print(error?.localizedDescription)
                completion(data: nil)
                return
            }
            completion(data: data)
            }
        dataTask.resume()
        }
}

