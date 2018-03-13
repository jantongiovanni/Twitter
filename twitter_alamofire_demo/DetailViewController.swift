//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Joe Antongiovanni on 3/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import ActiveLabel

class DetailViewController: UIViewController {
    
    var tweet: Tweet!
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailHandle: UILabel!
    @IBOutlet weak var detailText: ActiveLabel!
    @IBOutlet weak var detailCreatedAt: UILabel!
    
    @IBOutlet weak var detailReplyButton: UIButton!
    @IBOutlet weak var detailRetweetButton: UIButton!
    @IBOutlet weak var detailFavoriteButton: UIButton!
    
      

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
        if let tweet = tweet {
        let profileImage = NSURL(string: tweet.user.profileImage!)
        detailImage.setImageWith(profileImage! as URL)
        detailName.text = tweet.user.name
        detailHandle.text = "@" + tweet.user.screenName
        detailText.text = tweet.text
        detailCreatedAt.text = tweet.createdAtString
            
        detailText.enabledTypes = [.mention, .hashtag, .url]
        detailText.handleURLTap { (url) in UIApplication.shared.openURL(url)
        
        }
        }
        
        
        
    }

    @IBAction func onReply(_ sender: AnyObject) {
        
    }
    
    @IBAction func onRetweet(_ sender: AnyObject) {
        if(tweet?.retweeted == false){
            tweet.retweeted = true
            tweet.retweetCount += 1
            refreshData()
            APIManager.shared.retweet(with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error Retweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully Retweeted the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else{
            tweet.retweeted = false
            tweet.retweetCount -= 1
            refreshData()
            APIManager.shared.untweet(with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error Unretweeting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully Unretweeted the following Tweet: \n\(tweet.text)")
                }
            }
            
        }
    
        
        
    }
    
    @IBAction func onFavorite(_ sender: AnyObject) {
        if(tweet.favorited == false){
            tweet.favorited = true
            tweet.favoriteCount += 1
            refreshData()
            APIManager.shared.favorite( with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else{
            tweet.favorited = false
            tweet.favoriteCount -= 1
            refreshData()
            APIManager.shared.unfavorite(with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
                
            }
        }

    }
    
    
    func refreshData(){
        if(tweet.favorited)!{
            detailFavoriteButton.setImage(#imageLiteral(resourceName: "favor-icon-red"), for: .normal)
        }
        if(tweet.favorited == false){
            detailFavoriteButton.setImage(#imageLiteral(resourceName: "favor-icon"), for: .normal)
        }

        if(tweet.retweeted){
            detailRetweetButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .normal)
        }
        if(tweet.retweeted==false){
            detailRetweetButton.setImage(#imageLiteral(resourceName: "retweet-icon"), for: .normal)
        }

    
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let replyViewController = segue.destination as! ReplyViewController
            replyViewController.tweet = tweet
    }

}
