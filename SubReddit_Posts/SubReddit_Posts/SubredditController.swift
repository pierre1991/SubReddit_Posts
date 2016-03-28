//
//  SubredditController.swift
//  SubReddit_Posts
//
//  Created by Pierre on 3/28/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import Foundation

class SubredditController {
    
    
    static func searchPosts(searchTerm: String, completion:(topics: [Subreddit]) -> Void) {
        let url = NetworkController.searchByTopic(searchTerm)
        
        NetworkController.dataAtURL(url) { (data) -> Void in
            guard let topicData = data else {
                print("No Data")
                completion(topics: [])
                return
            }
            do {
                let dataArray = try NSJSONSerialization.JSONObjectWithData(topicData, options: .AllowFragments) as! [String:AnyObject]
                let topicsDictionary = dataArray[Subreddit.kTitle] as! [[String:String]]
                
                var arrayTopics: [Subreddit] = []
                
                for dictionary in topicsDictionary {
                    if let topic = Subreddit(jsonDictionary: dictionary) {
                        arrayTopics.append(topic)
                    }
                }
                completion(topics: arrayTopics)
            }
            catch {
                print("Error serializing data")
                completion(topics: [])
                return
            }
        }
    }
    
}