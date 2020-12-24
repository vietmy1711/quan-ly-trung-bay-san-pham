//
//  QuestionModel.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 24/12/2020.
//

import Foundation

enum QuestionType: String {
    case text = "Text"
    case multipleChoice = "Multiple Choice"
}

class QuestionModel {
    var title: String
    var type: QuestionType
    var choices: [String]?
    
    init(title: String, type: QuestionType, choices: [String]?) {
        self.title = title
        self.type = type
        self.choices = choices
    }
}
