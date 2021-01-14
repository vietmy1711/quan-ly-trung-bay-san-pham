//
//  SignatureViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 13/01/2021.
//

import UIKit

class SignatureViewController: UIViewController {

    @IBOutlet weak var signatureTextView: UITextView!
    
    var report: ReportModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Signature"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .done, target: self, action: #selector(finishBtnClick))
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func finishBtnClick() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupUI() {
        signatureTextView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        signatureTextView.layer.cornerRadius = 8
        signatureTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 4, right: 4)
        signatureTextView.text = "Sign here"
        signatureTextView.textColor = UIColor.placeholderText
        signatureTextView.delegate = self
    }
}

extension SignatureViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Sign here"
            textView.textColor = UIColor.placeholderText
        }
    }
}
