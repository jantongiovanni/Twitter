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
    
    var tweet: Tweet?
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailName: UILabel!
    @IBOutlet weak var detailHandle: UILabel!
    @IBOutlet weak var detailText: ActiveLabel!
    @IBOutlet weak var detailCreatedAt: UILabel!
    
    
    @IBOutlet weak var detailRetweetedButton: UIButton!
    @IBOutlet weak var detailFavoritedButton: UIButton!
    @IBOutlet weak var detailRetweetLabel: UILabel!
    @IBOutlet weak var detailFavoritedLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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

//    func refreshData(){
//        if(tweet?.retweeted)!{
//            detailRetweetedButton.setImage(#imageLiteral(resourceName: "retweet-icon-green"), for: .normal)
//        }
//        if(tweet?.retweeted==false){
//            detailRetweetedButton.setImage(#imageLiteral(resourceName: "retweet-icon"), for: .normal)
//        }
//
//    
//   }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
