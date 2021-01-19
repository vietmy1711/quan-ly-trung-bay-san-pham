//
//  AnswerQuestionViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 13/01/2021.
//

import UIKit

protocol AnswerQuestionDelegate {
    func didFinishSigning(report: ReportModel)
}

class AnswerQuestionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var report: ReportModel?
    
    var delegate: AnswerQuestionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Answer Question"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Signature", style: .plain, target: self, action: #selector(signatureBtnClicked))
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
    }
    
    @objc func signatureBtnClicked() {
        let signatureVC = SignatureViewController()
        signatureVC.report = self.report
        signatureVC.delegate = self
        self.navigationController?.pushViewController(signatureVC, animated: true)
    }
    
}

extension AnswerQuestionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return report?.template.questions.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell") as! QuestionCell
        var answer = AnswerModel(answer: "", type: .text, image: nil)
        if report!.answers.count < indexPath.row {
            answer = report!.answers[indexPath.row]
        } else {
            report!.answers.append(answer)
        }
        cell.configWithQuestionAnswer(question: (report?.template.questions[indexPath.row])!, answer: answer)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let answerQuestionDetailVC = AnswerQuestionDetailViewController()
        answerQuestionDetailVC.answer = report?.answers[indexPath.row]
        answerQuestionDetailVC.question = report?.template.questions[indexPath.row]
        answerQuestionDetailVC.delegate = self
        let navVC = UINavigationController(rootViewController: answerQuestionDetailVC)
        self.present(navVC, animated: true, completion: nil)
    }
}

extension AnswerQuestionViewController: AnswerQuestionDetailDelegate {
    func didFinishWithAnswer(answer: AnswerModel) {
        self.tableView.reloadData()
    }
}
extension AnswerQuestionViewController: SignatureDelegate {
    func didFinishdSigning(report: ReportModel) {
        self.delegate?.didFinishSigning(report: report)
    }
}
