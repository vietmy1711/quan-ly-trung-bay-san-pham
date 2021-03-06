//
//  ReportViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 15/12/2020.
//

import UIKit

class ReportViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var reports: [ReportModel] = []
    
    var inprogressReports: [ReportModel] = [
        ReportModel(name: "Báo cáo quán cà phê", description: "221 Trần Hưng Đạo, P.6, Q.1", image: #imageLiteral(resourceName: "templateimage"), shelfImage: #imageLiteral(resourceName: "templateimage"), progress: 0.3, template: templates[2], answers: []),
        ReportModel(name: "Báo cáo quán cà phê", description: "221 Trần Hưng Đạo, P.6, Q.1", image: #imageLiteral(resourceName: "templateimage"), shelfImage: #imageLiteral(resourceName: "templateimage"), progress: 0.8, template: templates[2], answers: []),
        ReportModel(name: "Báo cáo quán cà phê", description: "221 Trần Hưng Đạo, P.6, Q.1", image: #imageLiteral(resourceName: "templateimage"), shelfImage: #imageLiteral(resourceName: "templateimage"), progress: 0.1, template: templates[2], answers: [])
    ]
    
    var finishedReports: [ReportModel] = [
        ReportModel(name: "Báo cáo quán cà phê", description: "221 Trần Hưng Đạo, P.6, Q.1", image: #imageLiteral(resourceName: "templateimage"), shelfImage: #imageLiteral(resourceName: "templateimage"), progress: 1, template: templates[2], answers: [])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        
        reports = inprogressReports
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Report"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.navigationController?.navigationBar.tintColor = .mainColor
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
        tableView.register(UINib(nibName: "ReportCell", bundle: nil), forCellReuseIdentifier: "ReportCell")
        tableView.separatorStyle = .none
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            reports = inprogressReports
        } else {
            reports = finishedReports
        }
        tableView.reloadData()
    }
    
    
    @IBAction func newReportBtnClicked(_ sender: UIButton) {
        let chooseTemplateVC = ChooseTemplateViewController()
        chooseTemplateVC.delegate = self
        self.navigationController?.pushViewController(chooseTemplateVC, animated: true)
    }
}
extension ReportViewController: ChooseTemplateDelegate {
    func didFinishedWithReport(report: ReportModel) {
        inprogressReports.append(report)
        reports = inprogressReports
        segmentedControl.selectedSegmentIndex = 0
        tableView.reloadData()
    }
    
}

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReportCell") as! ReportCell
        cell.configWithReport(report: reports[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if (editingStyle == UITableViewCell.EditingStyle.delete) {
                let alert = UIAlertController(title: "Cancel report", message: "Are you sure you want to delete this report", preferredStyle: .alert)
                let delete = UIAlertAction(title: "Yes", style: .destructive) { (_) in
                    self.reports.remove(at: indexPath.row)
                    if self.segmentedControl.selectedSegmentIndex == 0 {
                        self.inprogressReports.remove(at: indexPath.row)
                    } else {
                        self.finishedReports.remove(at: indexPath.row)
                    }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.segmentedControl.selectedSegmentIndex == 1 {
            let reportDetailVC = ReportDetailViewController()
            self.navigationController?.pushViewController(reportDetailVC, animated: true)
        }
    }
}


