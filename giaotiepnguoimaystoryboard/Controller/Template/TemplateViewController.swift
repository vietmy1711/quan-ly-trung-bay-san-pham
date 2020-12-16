//
//  TemplateViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 15/12/2020.
//

import UIKit

class TemplateViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var lastContentOffset: CGFloat = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Template"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TemplateCell", bundle: nil), forCellReuseIdentifier: "TemplateCell")
        tableView.separatorStyle = .none
        
        setupTableViewHeaderView()
    }
    
    func setupTableViewHeaderView() {
        let headerView = HeaderView()
        headerView.resultNumber = 50
        tableView.tableHeaderView = headerView
        tableView.layoutIfNeeded()
    }
}

extension TemplateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateCell") as! TemplateCell
        return cell
    }
    
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (self.lastContentOffset > scrollView.contentOffset.y) {
//            // move up
//            self.searchBarHeightConstraint.constant = 56
//        } else if (self.lastContentOffset < scrollView.contentOffset.y) {
//            // move down
//            self.searchBarHeightConstraint.constant = 0
//        }
//        // update the new position acquired
//        self.lastContentOffset = scrollView.contentOffset.y
//
//    }
    
}

extension TemplateViewController: UISearchBarDelegate {
}
