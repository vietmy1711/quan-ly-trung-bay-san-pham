//
//  ReportDetailViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 19/01/2021.
//

import UIKit

class ReportDetailViewController: UIViewController {

    @IBOutlet weak var backButtion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setupUI() {
        backButtion.layer.shadowColor = UIColor.black.cgColor
        backButtion.layer.shadowOpacity = 0.2
        backButtion.layer.shadowOffset = CGSize(width: 2, height: 2)
        backButtion.layer.shadowRadius = 5
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
