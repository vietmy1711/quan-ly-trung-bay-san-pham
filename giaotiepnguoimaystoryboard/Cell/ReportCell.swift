//
//  ReportCell.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 07/01/2021.
//

import UIKit

class ReportCell: UITableViewCell {

    @IBOutlet weak var reportNameLabel: UILabel!
    @IBOutlet weak var reportDescriptionLabel: UILabel!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        self.selectionStyle = .none
    }
    
    func configWithReport(report: ReportModel) {
        self.reportNameLabel.text = report.name
        self.reportDescriptionLabel.text = report.description
        self.thumbImageView.image = report.image
        self.progressView.progress = report.progress
        if report.progress < 1 {
            self.progressLabel.text = "In-progress, a few minutes left"
            self.rightImageView.isHidden = true
        } else {
            self.progressLabel.text = "An hour ago"
            self.rightImageView.isHidden = false
        }
    }
    
}
