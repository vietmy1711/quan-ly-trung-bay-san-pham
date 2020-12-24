//
//  TemplateViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 15/12/2020.
//

import UIKit

class TemplateViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newButton: UIButton!
    
    private var lastContentOffset: CGFloat = 0
    var headerView: HeaderView!

    
    var templates: [TemplateModel] = [
        TemplateModel(name: "Ghi nhận siêu thị", detail: "Dành cho siêu thị lớn", date: "1 year ago", image: #imageLiteral(resourceName: "templateimage"), questions: []),
        TemplateModel(name: "Ghi nhận quán cà phê", detail: "Có tủ lạnh trưng bày", date: "1 year ago", image: #imageLiteral(resourceName: "templateimage"), questions: []),
        TemplateModel(name: "Ghi nhận tạp hóa", detail: "Có quầy hàng", date: "1 year ago", image: #imageLiteral(resourceName: "templateimage"), questions: [])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Template"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.navigationController?.navigationBar.tintColor = .mainColor
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setupUI() {
        newButton.layer.cornerRadius = 30
        newButton.layer.shadowColor = UIColor.black.cgColor
        newButton.layer.shadowOpacity = 0.2
        newButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        newButton.layer.shadowRadius = 5
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TemplateCell", bundle: nil), forCellReuseIdentifier: "TemplateCell")
        tableView.separatorStyle = .none
        
        setupTableViewHeaderView()
    }
    
    func setupTableViewHeaderView() {
        headerView = HeaderView()
        headerView.resultNumber = templates.count
        tableView.tableHeaderView = headerView
        tableView.layoutIfNeeded()
    }
    
    @IBAction func newTemplateBtnClicked(_ sender: UIButton) {
        let newTemplateVC = NewTemplateViewController()
        newTemplateVC.delegate = self
        self.navigationController?.pushViewController(newTemplateVC, animated: true)
    }
}

extension TemplateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        headerView.resultNumber = templates.count
        return templates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateCell") as! TemplateCell
        cell.configWithTemplate(template: templates[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if (editingStyle == UITableViewCell.EditingStyle.delete) {
                let alert = UIAlertController(title: "Delete this template", message: "Are you sure you want to delete this template", preferredStyle: .alert)
                let delete = UIAlertAction(title: "Yes", style: .destructive) { (_) in
                    self.templates.remove(at: indexPath.row)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(delete)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension TemplateViewController: UISearchBarDelegate {
}

extension TemplateViewController: NewTemplateDelegate {
    func didFinishedWithNewTemplate(template: TemplateModel) {
        self.templates.append(template)
        self.tableView.reloadData()
    }
}
