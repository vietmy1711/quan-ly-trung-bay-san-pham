//
//  ReportModel.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 07/01/2021.
//

import UIKit

class ReportModel {
    var name: String = ""
    var description: String = ""
    var image: UIImage?
    var progress: Float = 0.0
    var template: TemplateModel
    var answers: [AnswerModel]
    
    init(name: String, description: String, image: UIImage?, progress: Float, template: TemplateModel, answers: [AnswerModel]) {
        self.name = name
        self.description = description
        self.image = image
        self.progress = progress
        self.template = template
//        self.template = TemplateModel(name: template.name, detail: template.detail, date: template.date, image: template.image, questions: template.questions)
        self.answers = answers
    }
}
