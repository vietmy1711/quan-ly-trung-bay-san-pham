//
//  AnswerModel.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 07/01/2021.
//

import Foundation

class AnswerModel {
    var answer: String = ""
    var type: QuestionType
    init(answer: String, type: QuestionType) {
        self.answer = answer
        self.type = type
    }
}
