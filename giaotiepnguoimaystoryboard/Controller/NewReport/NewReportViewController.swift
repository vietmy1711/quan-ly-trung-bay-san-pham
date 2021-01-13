//
//  NewReportViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 13/01/2021.
//

import UIKit

class NewReportViewController: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var shelfImageView: UIImageView!
    
    var report: ReportModel?
    
    var isThumbnail = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "New Report"
        self.tabBarController?.tabBar.isHidden = true
        
        if report?.template.questions.count == 0 {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Signature", style: .plain, target: self, action: #selector(signatureBtnClicked))
        } else {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Answer question", style: .plain, target: self, action: #selector(answerQuestionBtnClicked))
        }
    }
    
    func setupUI() {
        nameView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        nameView.layer.cornerRadius = 8
        
        detailTextView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        detailTextView.layer.cornerRadius = 8
        detailTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 4, right: 4)
        detailTextView.text = "Report description"
        detailTextView.textColor = UIColor.placeholderText
        detailTextView.delegate = self
        
        nameTextField.delegate = self
        
        addImageButton.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        addImageButton.layer.cornerRadius = 8
        
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        
        thumbnailImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAddThumbnail)))
        
        shelfImageView.layer.cornerRadius = 8
        shelfImageView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        
        shelfImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAddShelfImage)))
        
    }
    
    @IBAction func addImageBtnClicked(_ sender: UIButton) {
        handleAddImage()
    }
    
    @objc func handleAddThumbnail() {
        isThumbnail = true
        handleAddImage()
    }
    
    @objc func handleAddShelfImage() {
        isThumbnail = false
        handleAddImage()
    }
    
    func handleAddImage() {
        let actionSheet = UIAlertController(title: "Choose your source", message: "", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Take from camera", style: .default) { [weak self] (_) in
            self?.chooseFromCamera()
        }
        let library = UIAlertAction(title: "Choose from library", style: .default) {  [weak self] (_) in
            self?.chooseFromLibrary()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(library)
        actionSheet.addAction(cancel)

        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func chooseFromCamera() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .camera
        self.present(pickerController, animated: true, completion: nil)
    }
    
    func chooseFromLibrary() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes = ["public.image", "public.movie"]
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @objc func signatureBtnClicked() {
        let signatureVC = SignatureViewController()
        self.navigationController?.pushViewController(signatureVC, animated: true)
    }
    
    @objc func answerQuestionBtnClicked() {
        let answerQuestionVC = AnswerQuestionViewController()
        self.navigationController?.pushViewController(answerQuestionVC, animated: true)
    }
}

extension NewReportViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Report description"
            textView.textColor = UIColor.placeholderText
        } else {
            self.report?.description = textView.text
        }
    }
}

extension NewReportViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.report?.name = textField.text ?? ""
    }
}

extension NewReportViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        if isThumbnail {
            self.thumbnailImageView.image = chosenImage
            self.report?.image = chosenImage
        } else {
            self.shelfImageView.image = chosenImage
            self.report?.shelfImage = chosenImage
        }
        self.dismiss(animated: true, completion: nil)
    }
}
