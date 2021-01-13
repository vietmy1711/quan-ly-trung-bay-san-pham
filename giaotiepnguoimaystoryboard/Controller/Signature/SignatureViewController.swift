//
//  SignatureViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 13/01/2021.
//

import UIKit

class SignatureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
}
