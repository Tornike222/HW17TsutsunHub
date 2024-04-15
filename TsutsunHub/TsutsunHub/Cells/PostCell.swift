//
//  PostsCell.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

protocol PostsCellDelegate {
    func deletePost(from cell: PostCell)
}

class PostCell: UICollectionViewCell {
    var delegate: PostsCellDelegate?
    
    let postIcon: UIImageView = {
        let postIcon = UIImageView()
        postIcon.translatesAutoresizingMaskIntoConstraints = false
        return postIcon
    }()
    
    let deleteButton: UIButton = {
        let deleteButton = UIButton()
        deleteButton.setImage(UIImage(named: "Delete") ?? UIImage(), for: .normal)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        return deleteButton
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
        addDeleteButton()
        addPostStackView()
        addTitleText()
        addBodyLabel()
    }
    
    func addPostIcon(){
        addSubview(postIcon)
        NSLayoutConstraint.activate([
            postIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            postIcon.widthAnchor.constraint(equalToConstant: 40),
            postIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    func addDeleteButton(){
        addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            deleteButton.widthAnchor.constraint(equalToConstant: 20),
            deleteButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        deleteButton.addAction(UIAction(handler: { _ in
            self.deleteButtonTapped()
            self.deleteButton.setImage(UIImage(named: "Delete") ?? UIImage(), for: .normal)
        }), for: .touchUpInside)
        deleteButton.addAction(UIAction(handler: { _ in
            self.deleteButton.setImage(UIImage(named: "DeleteClicked") ?? UIImage(), for: .normal)
        }), for: .touchDown)
    }
    
    func addPostStackView(){
        addSubview(postStackView)
        NSLayoutConstraint.activate([
            postStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            postStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            postStackView.topAnchor.constraint(equalTo: postIcon.bottomAnchor, constant: 12)
        ])
    }
    
    func addTitleText(){
        postStackView.addArrangedSubview(titleLabel)
        titleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    func addBodyLabel(){
        postStackView.addArrangedSubview(bodyLabel)
        bodyLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
    
    func deleteButtonTapped(){
        delegate?.deletePost(from: self)
    }
    
    
}

#Preview{
    PostCell()
}
