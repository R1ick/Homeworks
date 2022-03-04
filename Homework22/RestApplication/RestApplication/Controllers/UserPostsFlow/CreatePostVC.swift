//
//  CreatePostVC.swift
//  RestApplication
//
//  Created by Ярослав Антонович on 04.03.2022.
//

import UIKit

class CreatePostVC: BaseViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var bodyTF: UITextView!
    
    var post: Post?
    var closure: ((Post) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addPostACtion(_ sender: Any) {
        if let text = titleTF.text, text.count < 10 {
            showWaring(text: "Title must have at least 10 symbols")
            return
        }
        if let text = bodyTF.text, text.count < 10 {
            showWaring(text: "Body must have at least 10 symbols")
            return
        }
        post = Post(userId: nil, id: nil, title: titleTF.text, body: bodyTF.text)
        closure?(post!)
        self.dismiss(animated: true, completion: nil)
    }
}
