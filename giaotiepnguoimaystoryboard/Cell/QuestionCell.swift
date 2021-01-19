//
//  QuestionCell.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 24/12/2020.
//

import UIKit

class QuestionCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configWithQuestion(question: QuestionModel) {
        titleLabel.text = question.title
        typeLabel.text = question.type.rawValue
    }

    func configWithQuestionAnswer(question: QuestionModel, answer: AnswerModel?) {
        titleLabel.text = question.title
        if let answer = answer, !answer.answer.isEmpty {
            typeLabel.text = answer.answer
        } else {
            typeLabel.text = "No answer"
        }
    }
}
