//
//  QuestionDetailViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 27/12/2020.
//

import UIKit

protocol QuestionDetailDelegate: class {
    func didFinishWithQuestion(question: QuestionModel)
}

class QuestionDetailViewController: UIViewController {
    
    @IBOutlet weak var questionTitleTextField: UITextField!
    @IBOutlet weak var questionTitleView: UIView!
    
    var question: QuestionModel?
    weak var delegate: QuestionDetailDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
        setupUI()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Submit question"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(finishBtnClicked))
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        self.navigationController?.navigationBar.tintColor = .mainColor
        
    }
    
    
    func setupUI() {
        questionTitleView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        questionTitleView.layer.cornerRadius = 8

        questionTitleTextField.delegate = self
    }
    
    @objc func finishBtnClicked() {
        guard let question = self.question else { return }
        guard !question.title.isEmpty else {
            handleEmptyError()
            return
        }
        self.delegate?.didFinishWithQuestion(question: question)
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func setupQuestion() {
        if question == nil {
            question = QuestionModel(title: "", type: .text, choices: nil)
        }
    }
    
    func handleEmptyError() {
        print("Question cannot be empty")
    }
    
}

extension QuestionDetailViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.question?.title = textField.text ?? ""
    }
}
