//
//  AddQuestionViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 16/12/2020.
//

import UIKit

class AddQuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Add Question"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .done, target: self, action: #selector(finishBtnClicked))
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func finishBtnClicked() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
