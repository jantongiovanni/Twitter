//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetUsernameLabel: UILabel!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetCreatedAtLabel: UILabel!
    @IBOutlet weak var tweetRetweetedLabel: UILabel!
    @IBOutlet weak var tweetFavoritedLabel: UILabel!
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            tweetUsernameLabel.text = tweet.user.name
            tweetScreenNameLabel.text = tweet.user.screenName
            tweetCreatedAtLabel.text = tweet.createdAtString
            tweetRetweetedLabel.text = String(tweet.retweetCount)
            tweetFavoritedLabel.text = String(tweet.favoriteCount ?? 0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
