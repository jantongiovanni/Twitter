//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Joe Antongiovanni on 3/9/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileHandle: UILabel!
    @IBOutlet weak var profileFollowing: UILabel!
    @IBOutlet weak var profileFollowers: UILabel!
    @IBOutlet weak var profileStatuses: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let profImage = URL(string: (User.current?.profileImage)!)
        profileImage.af_setImage(withURL: profImage!)
        profileName.text = User.current?.name
        profileHandle.text = "@" + (User.current?.screenName)!
        profileFollowers.text = (User.current?.followersCount)! + " Followers"
        profileFollowing.text = (User.current?.friendsCount)! + " Following"
        profileStatuses.text = (User.current?.statusesCount)! + " Statuses"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(_ sender: AnyObject) {
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
