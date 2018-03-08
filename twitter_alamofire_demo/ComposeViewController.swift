//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Joe Antongiovanni on 3/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ComposeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var ComposeCancelButton: UIBarButtonItem!
    @IBOutlet weak var ComposeTweetButton: UIBarButtonItem!
    @IBOutlet weak var ComposeText: UITextField!
    @IBOutlet weak var ComposeUserImage: UIImageView!
    @IBOutlet weak var ComposeNameLabel: UILabel!
    @IBOutlet weak var ComposeTextField: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ComposeTextField.delegate = self
        refreshData()
        
        //let profileImage = URL(string: (User.current?.profileImageUrl)!)
        //ComposeUserImage.af_setImage(withURL: profileImageUrl!)
        print(User.current?.profileImageUrl)
        print(User.current?.profileImage)
        print(User.current?.followersCount)
        
        ComposeUserImage.af_setImage(withURL: (User.current?.profileImageUrl)!)
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        ComposeTextField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshData(){
        ComposeUserImage.image = nil
        ComposeNameLabel.text = User.current?.name
        
        //let profileImage = URL(string: (User.current?.profileImage)!)
        //print(profileImage)
        //ComposeUserImage.setImageWith(profileImage! as URL)
    
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
