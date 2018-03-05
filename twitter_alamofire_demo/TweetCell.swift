//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetUsernameLabel: UILabel!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetCreatedAtLabel: UILabel!
    @IBOutlet weak var tweetRetweetedLabel: UILabel!
    @IBOutlet weak var tweetFavoritedLabel: UILabel!
    @IBOutlet weak var tweetFavoritedButton: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            tweetUsernameLabel.text = tweet.user.name
            tweetScreenNameLabel.text = tweet.user.screenName
            tweetCreatedAtLabel.text = tweet.createdAtString
            tweetRetweetedLabel.text = String(tweet.retweetCount)
            tweetFavoritedLabel.text = String(tweet.favoriteCount )
            tweetProfileImageView.image = nil
            
            let profileImage = NSURL(string: tweet.user.profileImage!)
            tweetProfileImageView.setImageWith(profileImage! as URL)
            
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func didTapFavorite(_ sender: Any) {
    tweetFavoritedButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: .normal)
        tweet.favorited = true
        tweet.favoriteCount += 1
        
        APIManager.shared.favoriteTweet(with: tweet) { (tweet: Tweet?, error: Error?) in
            if let  error = error {
                print("Error favoriting tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                print("Successfully favorited the following Tweet: \n\(tweet.text)")
            }
        }
    
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
