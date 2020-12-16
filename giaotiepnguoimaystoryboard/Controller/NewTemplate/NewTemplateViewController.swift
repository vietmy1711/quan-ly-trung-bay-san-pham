//
//  NewTemplateViewController.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 16/12/2020.
//

import UIKit

class NewTemplateViewController: UIViewController {
    
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "New Template"
    }
    
    func setupUI() {
        nameView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        nameView.layer.cornerRadius = 8
        
        detailTextView.backgroundColor = UIColor(white: 0, alpha: 0.04)
        detailTextView.layer.cornerRadius = 8
        detailTextView.textContainerInset = UIEdgeInsets(top: 12, left: 4, bottom: 4, right: 4)
        detailTextView.text = "Template detail"
        detailTextView.textColor = UIColor.placeholderText
        detailTextView.delegate = self
        
        addImageButton.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        addImageButton.layer.cornerRadius = 8
        
        thumbnailImageView.layer.cornerRadius = 8
        thumbnailImageView.backgroundColor = UIColor(white: 0, alpha: 0.04)
    }
    
    @IBAction func addImageBtnClicked(_ sender: UIButton) {
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
    

}

extension NewTemplateViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.placeholderText {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Template detail"
            textView.textColor = UIColor.placeholderText
        }
    }
}

extension NewTemplateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.thumbnailImageView.image = chosenImage
        self.dismiss(animated: true, completion: nil)
    }
}
