//
//  AnswerModel.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 07/01/2021.
//

import UIKit

class AnswerModel {
    var answer: String = ""
    var image: UIImage?
    var type: QuestionType
    init(answer: String, type: QuestionType, image: UIImage?) {
        self.answer = answer
        self.type = type
        self.image = image
    }
}
