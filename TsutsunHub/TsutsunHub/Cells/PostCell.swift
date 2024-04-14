//
//  PostsCell.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

class PostCell: UICollectionViewCell {
    let postIcon: UIImageView = {
        let postIcon = UIImageView()
        postIcon.translatesAutoresizingMaskIntoConstraints = false
        return postIcon
    }()
    
    let postStackView: UIStackView = {
        let postStackView = UIStackView()
        postStackView.axis = .vertical
        postStackView.spacing = 1
        postStackView.translatesAutoresizingMaskIntoConstraints = false
        postStackView.alignment = .top
        return postStackView
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont(name: "FiraGO-Regular", size: 15)
        return titleLabel
    }()
    
    let bodyLabel: UILabel = {
        let bodyLabel = UILabel()
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.textColor = .white
        bodyLabel.numberOfLines = 5
        bodyLabel.layer.opacity = 0.5
        bodyLabel.font = UIFont(name: "FiraGO-Regular", size: 12)
        return bodyLabel
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = #colorLiteral(red: 0.1236573234, green: 0.1336543858, blue: 0.17180565, alpha: 1)
        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addPostIcon()
        addPostStackView()
        addTitleText()
        addBodyLabel()
    }
    func addTitleText(){
        postStackView.addArrangedSubview(titleLabel)
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    func addBodyLabel(){
        postStackView.addArrangedSubview(bodyLabel)
        bodyLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    func addPostIcon(){
        addSubview(postIcon)
        NSLayoutConstraint.activate([
            postIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            postIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            postIcon.widthAnchor.constraint(equalToConstant: 40),
            postIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    func addPostStackView(){
        addSubview(postStackView)
        NSLayoutConstraint.activate([
            postStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postStackView.topAnchor.constraint(equalTo: postIcon.bottomAnchor, constant: 12)
        ])

        
    }
    
}

#Preview{
    PostCell()
}
