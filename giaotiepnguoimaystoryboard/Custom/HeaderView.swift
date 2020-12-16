//
//  HeaderView.swift
//  giaotiepnguoimaystoryboard
//
//  Created by MM on 16/12/2020.
//

import UIKit

class HeaderView: UIView {
    var resultNumber:Int = 0 {
        didSet {
            resultLabel.text = resultNumber > 1 ? "\(resultNumber) results" : "\(resultNumber) result"
        }
    }
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for templates"
        searchBar.returnKeyType = .search
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0 result"
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    let filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Filter", for: .normal)
        button.setTitleColor(.secondaryColor, for: .normal)
        button.setTitleColor(.lightMainColor, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(searchBar)
        self.addSubview(stackView)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        
        searchBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(filterButton)
        
        resultLabel.text = String(resultNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
