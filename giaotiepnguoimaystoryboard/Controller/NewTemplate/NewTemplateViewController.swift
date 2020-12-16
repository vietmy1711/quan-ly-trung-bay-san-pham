//
//  NewTemplateViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 16/12/2020.
//

import UIKit

class NewTemplateViewController: UIViewController {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "New Template"
    }
    
    func setupUI() {
        nameView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        nameView.layer.cornerRadius = 8

        detailTextView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        detailTextView.layer.cornerRadius = 8
        detailTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 4, right: 4)
        detailTextView.text = "Template detail"
        detailTextView.textColor = UIColor.placeholderText
        detailTextView.delegate = self


    }

}

extension NewTemplateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Template detail"
            textView.textColor = UIColor.placeholderText
        }
    }
}
