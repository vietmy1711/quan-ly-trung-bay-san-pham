//
//  LoginViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 15/12/2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailView.backgroundColor = UIColor(white: 0, alpha: 0.08)
        emailView.layer.cornerRadius = 15
        
        passwordView.backgroundColor = UIColor(white: 0, alpha: 0.08)
        passwordView.layer.cornerRadius = 15
        
        loginButton.layer.cornerRadius = 25
    }
    @IBAction func loginClicked(_ sender: UIButton) {
        let templateVC = UINavigationController(rootViewController: TemplateViewController())
        templateVC.modalPresentationStyle = .fullScreen
        templateVC.tabBarItem = UITabBarItem(title: "Template", image: UIImage(systemName: "doc.text.fill"), tag: 0)

        let reportVC = UINavigationController(rootViewController: ReportViewController())
        reportVC.tabBarItem = UITabBarItem(title: "Report", image: UIImage(systemName: "doc.append"), tag: 1)

        let tabBar = UITabBarController()
        tabBar.tabBar.tintColor = .mainColor
        tabBar.viewControllers = [templateVC, reportVC]
        UIApplication.shared.windows.first?.rootViewController = tabBar
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
