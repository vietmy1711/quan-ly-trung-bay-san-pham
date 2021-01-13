//
//  AnswerQuestionViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 13/01/2021.
//

import UIKit

class AnswerQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Answer Question"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Signature", style: .plain, target: self, action: #selector(signatureBtnClicked))
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func signatureBtnClicked() {
        let signatureVC = SignatureViewController()
        self.navigationController?.pushViewController(signatureVC, animated: true)
    }
    
}
