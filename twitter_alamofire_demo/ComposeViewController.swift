//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by Joe Antongiovanni on 3/7/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AFNetworking
import AlamofireImage

protocol ComposeViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    weak var delegate: ComposeViewControllerDelegate?

    @IBOutlet weak var ComposeCancelButton: UIBarButtonItem!
    @IBOutlet weak var ComposeTweetButton: UIBarButtonItem!
    @IBOutlet weak var ComposeUserImage: UIImageView!
    @IBOutlet weak var ComposeTextField: UITextView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var ComposeCharCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        ComposeTextField.delegate = self
        
        let profileImage = URL(string: (User.current?.profileImage)!)
        ComposeUserImage.af_setImage(withURL: profileImage!)
        
        print(User.current?.profileImageUrl)
        print(User.current?.profileImage)
        print(User.current?.followersCount)
        
        //ComposeUserImage.af_setImage(withURL: (User.current?.profileImage)!)

    
    }
    
   
    @IBAction func didTapTweet(_ sender: AnyObject) {
        APIManager.shared.composeTweet(with: ComposeTextField.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func button(_ sender: AnyObject) {
        APIManager.shared.composeTweet(with: ComposeTextField.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        ComposeTextField.text = ""
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        ComposeCharCount.text = String(140 - newText.characters.count)
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
