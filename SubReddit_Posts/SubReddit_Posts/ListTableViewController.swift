//
//  ListTableViewController.swift
//  SubReddit_Posts
//
//  Created by Pierre on 3/28/16.
//  Copyright © 2016 pierre. All rights reserved.
//

import UIKit

class ListTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    //MARK: Properties
    var redditTopicArray: [Subreddit] = []
    @IBOutlet weak var searchTextField: UITextField!
    
    
    //MARK: App Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    //MARK: Actions
    @IBAction func searchButtonTapped(sender: AnyObject) {
        if let searchText = searchTextField.text {
            SubredditController.searchPosts(searchText, completion: { (topics) -> Void in
                if topics.count > 0 {
                    self.redditTopicArray = topics
                } else {
                    print("Error")
                }
            })
        }
    }


    //MARK: Table View Delegate & DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return redditTopicArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("topicCell", forIndexPath: indexPath)
        
        let topic = redditTopicArray[indexPath.row]
        
        if let topicName = topic.title {
            cell.textLabel?.text = topicName
        }
        
        return cell
    }

    


}
