//
//  PostsViewController.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

class PostsViewController: UIViewController {
    //MARK: - UIDesign variables
    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "BlueBackground")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.backgroundColor = .black
        return backgroundImage
    }()
    
    let postsCollectionView: UICollectionView = {
        let postCollectionFlowLayout = UICollectionViewFlowLayout()
        postCollectionFlowLayout.scrollDirection = .vertical
        postCollectionFlowLayout.itemSize = CGSize(width: 158, height: 192)
        postCollectionFlowLayout.minimumLineSpacing = 30
        let postsCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: postCollectionFlowLayout)
        postsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        postsCollectionView.backgroundColor = .clear
        return postsCollectionView
    }()
    
    let newPostButton: CustomButton = {
        let startButton = CustomButton()
        startButton.setTitle("წუწუნ ბარათის დამატება", for: .normal)
        return startButton
    }()
    
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        postsCollectionView.reloadData()
    }
    
    //MARK: - Functions
    func setupUI(){
        hideTopNavigationBar()
        addBackgroundImage()
        setupPostsCollectionView()
        addNewPostButton()
    }
    
    func hideTopNavigationBar(){
        navigationController?.navigationBar.isHidden = true
    }
    
    func addBackgroundImage(){
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupPostsCollectionView(){
        postsCollectionView.dataSource = self
        
        view.addSubview(postsCollectionView)
        NSLayoutConstraint.activate([
            postsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            postsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            postsCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
        postsCollectionView.register(PostCell.self, forCellWithReuseIdentifier: "PostCell")
    }
    func addNewPostButton(){
        view.addSubview(newPostButton)
        
        NSLayoutConstraint.activate([
            newPostButton.topAnchor.constraint(equalTo: postsCollectionView.bottomAnchor, constant: 147),
            newPostButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            newPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -43),
            
        ])
        
        newPostButton.addAction(UIAction(handler: { _ in
            self.buttonTouchedUpInside()
        }), for: .touchUpInside)
    }
    
    func buttonTouchedUpInside(){
        let newPostVC = NewPostViewController()
        navigationController?.pushViewController(newPostVC, animated: true)
        tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
    }

}
//MARK: - UICollectionViewDataSource extension
extension PostsViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        existingPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let postCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as? PostCell
        postCell?.delegate = self
        let currentPost = existingPosts[indexPath.row]
        postCell?.titleLabel.text = currentPost.title
        postCell?.bodyLabel.text = currentPost.description
        postCell?.postIcon.image = UIImage(named: currentPost.icon.rawValue) ?? UIImage()
        return postCell ?? UICollectionViewCell()
    }
}

extension PostsViewController: PostsCellDelegate {
    func deletePost(from cell: PostCell) {
        if let indexPath = postsCollectionView.indexPath(for: cell){
            existingPosts.remove(at: indexPath.row)
            postsCollectionView.reloadData()
        }
    }
    
}



#Preview{
    PostsViewController()
}
