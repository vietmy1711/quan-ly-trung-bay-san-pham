//
//  ChooseTemplateViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 07/01/2021.
//

import UIKit

protocol ChooseTemplateDelegate {
    func didFinishedWithReport(report: ReportModel)
}

class ChooseTemplateViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ChooseTemplateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Choose Template"
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TemplateCell", bundle: nil), forCellReuseIdentifier: "TemplateCell")
        tableView.separatorStyle = .none
    }

}

extension ChooseTemplateViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return templates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateCell") as! TemplateCell
        cell.configWithTemplate(template: templates[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newReportVC = NewReportViewController()
        let report = ReportModel(name: "", description: "", image: nil, shelfImage: nil, progress: 0, template: templates[indexPath.row], answers: [])
        newReportVC.report = report
        newReportVC.delegate = self
        self.navigationController?.pushViewController(newReportVC, animated: true)
    }
}

extension ChooseTemplateViewController: NewReportDelegate {
    func didFinishSigning(report: ReportModel) {
        self.delegate?.didFinishedWithReport(report: report)
    }
}
