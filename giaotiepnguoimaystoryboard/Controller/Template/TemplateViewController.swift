//
//  TemplateViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 15/12/2020.
//

import UIKit

class TemplateViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showSearchBar()
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
        
    }
    
    func showSearchBar() {
        let searchController = UISearchController()
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = true
        navigationItem.hidesSearchBarWhenScrolling = true
        searchController.searchBar.sizeToFit()
        searchController.searchBar.returnKeyType = UIReturnKeyType.search
        navigationItem.searchController = searchController
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
    
    
}

extension TemplateViewController: UISearchBarDelegate {
}
