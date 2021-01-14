//
//  TemplateCell.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 15/12/2020.
//

import UIKit

class TemplateCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var templateImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configWithTemplate(template: TemplateModel, isEdit: Bool = false) {
        self.nameLabel.text = template.name
        self.detailLabel.text = template.detail
        self.dateLabel.text = template.questions.count > 1 ? "\(template.questions.count) questions" : "\(template.questions.count) question"
        self.templateImageView.image = template.image
        if isEdit {
            self.rightImageView.image = UIImage(systemName: "pencil")
        } else {
            self.rightImageView.image = UIImage(systemName: "chevron.right")
        }
    }
    
}
