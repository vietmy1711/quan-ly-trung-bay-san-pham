//
//  AddQuestionViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 16/12/2020.
//

import UIKit

protocol AddQuestionDelegate: class {
    func didFinishedWithNewTemplate(template: TemplateModel)
}

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var noQuestionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: AddQuestionDelegate?
    
    var template: TemplateModel?
    
    var questions: [QuestionModel] = [] {
        didSet {
            if questions.isEmpty {
                noQuestionLabel.isHidden = false
            } else {
                noQuestionLabel.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Add Question"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finish", style: .done, target: self, action: #selector(finishBtnClicked))
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func finishBtnClicked() {
        self.delegate?.didFinishedWithNewTemplate(template: template!)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setupUI() {
        addButton.layer.cornerRadius = 30
        addButton.layer.shadowColor = UIColor.black.cgColor
        addButton.layer.shadowOpacity = 0.2
        addButton.layer.shadowOffset = CGSize(width: 2, height: 2)
        addButton.layer.shadowRadius = 5
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
    }
    
    @IBAction func newQuestionButtonClicked(_ sender: UIButton) {
        let questionDetailVC = QuestionDetailViewController()
        questionDetailVC.delegate = self
        let navVC = UINavigationController(rootViewController: questionDetailVC)
        self.present(navVC, animated: true, completion: nil)
    }
    
}

extension AddQuestionViewController: QuestionDetailDelegate {
    func didFinishWithQuestion(question: QuestionModel) {
        self.template?.questions.append(question)
        tableView.reloadData()
    }
    
}

extension AddQuestionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if template?.questions.count ?? 0 == 0 {
            noQuestionLabel.isHidden = false
        } else {
            noQuestionLabel.isHidden = true
        }
        return template?.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as! QuestionCell
        cell.configWithQuestion(question: (template?.questions[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            if (editingStyle == UITableViewCell.EditingStyle.delete) {
                let alert = UIAlertController(title: "Delete this quesion", message: "Are you sure you want to delete this question", preferredStyle: .alert)
                let delete = UIAlertAction(title: "Yes", style: .destructive) { (_) in
                    self.template?.questions.remove(at: indexPath.row)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(delete)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
            }        }
    }
    
}
