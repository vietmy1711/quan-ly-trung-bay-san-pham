//
//  AnswerQuestionDetailViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 14/01/2021.
//

import UIKit

protocol AnswerQuestionDetailDelegate: class {
    func didFinishWithAnswer(answer: AnswerModel)
}

class AnswerQuestionDetailViewController: UIViewController {

    @IBOutlet weak var questionTitleLabel: UILabel!
    @IBOutlet weak var answerTextView: UITextView!
    
    var question: QuestionModel?
    var answer: AnswerModel?
    
    var answerText: String = ""
    
    weak var delegate: AnswerQuestionDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Answer question"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Answer", style: .done, target: self, action: #selector(finishBtnClicked))
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.navigationController?.navigationBar.tintColor = .mainColor
    }

    func setupUI() {
        answerTextView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        answerTextView.layer.cornerRadius = 8
        answerTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 4, right: 4)
        answerTextView.text = "Answer here"
        answerTextView.textColor = UIColor.placeholderText
        answerTextView.delegate = self
        
        self.hideKeyboardWhenTappedAround()
    }
    
    @objc func finishBtnClicked() {
        self.answer?.answer = answerText
        delegate?.didFinishWithAnswer(answer: answer!)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func setupQuestion() {
        guard let question = self.question else { return }
        self.questionTitleLabel.text = question.title
    }
    
    func handleEmptyError() {
        let alert = UIAlertController(title: "Error", message: "Question title cannot be empty", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

extension AnswerQuestionDetailViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Answer here"
            textView.textColor = UIColor.placeholderText
        } else {
            self.answerText = textView.text
        }
    }
}
