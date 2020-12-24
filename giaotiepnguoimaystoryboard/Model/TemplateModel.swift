//
//  TemplateModel.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 16/12/2020.
//

import UIKit

class TemplateModel {
    var name: String
    var detail: String
    var date: String
    var image: UIImage
    var questions: [QuestionModel]
    
    init(name: String, detail: String,date: String, image: UIImage, questions: [QuestionModel]) {
        self.name = name
        self.detail = detail
        self.date = date
        self.image = image
        self.questions = questions
    }
}
