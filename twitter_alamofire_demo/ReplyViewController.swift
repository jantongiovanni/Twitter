//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by Joe Antongiovanni on 3/12/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ReplyViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}
class ReplyViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var replyTextField: UITextView!
    @IBOutlet weak var replyCharCount: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    
    weak var delegate: ReplyViewControllerDelegate?
    
    var tweet: Tweet!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        replyTextField.delegate = self
    }

    @IBAction func onReply(_ sender: AnyObject) {
        let replyText = replyTextField.text
        APIManager.shared.replyTweet(with: replyText!, with: String(tweet.id)){(tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
            }
        }
    }
    
    
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        // Set the max character limit
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        replyCharCount.text = String(140 - newText.characters.count)
        
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        replyTextField.text = "@" + String(tweet.user.screenName) + " "
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
