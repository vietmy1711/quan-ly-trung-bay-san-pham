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
    
    var templates: [TemplateModel] = [
        TemplateModel(id: 1, name: "Ghi nhận siêu thị", detail: "Dành cho siêu thị lớn", date: "1 year ago", image: #imageLiteral(resourceName: "templateimage")),
        TemplateModel(id: 2, name: "Ghi nhận quán cà phê", detail: "Có tủ lạnh trưng bày", date: "1 year ago", image: #imageLiteral(resourceName: "templateimage")),
        TemplateModel(id: 3, name: "Ghi nhận tạp hóa", detail: "Có quầy hàng", date: "1 year ago", image: #imageLiteral(resourceName: "templateimage"))

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
        let headerView = HeaderView()
        headerView.resultNumber = 50
        tableView.tableHeaderView = headerView
        tableView.layoutIfNeeded()
    }
    
    @IBAction func newTemplateBtnClicked(_ sender: UIButton) {
        let newTemplateVC = NewTemplateViewController()
        self.navigationController?.pushViewController(newTemplateVC, animated: true)
    }
}

extension TemplateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return templates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateCell") as! TemplateCell
        cell.configWithTemplate(template: templates[indexPath.row])
        return cell
    }
}

extension TemplateViewController: UISearchBarDelegate {
}
