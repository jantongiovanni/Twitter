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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tweet = tweet{
            detailName.text = tweet.user.name
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
