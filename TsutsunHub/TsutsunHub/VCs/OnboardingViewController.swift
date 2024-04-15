//
//  ViewController.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

class OnboardingViewController: UIViewController {
    //MARK: - UIDesign variables
    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "InitialScreenBackground")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    let onboardText: UILabel = {
       let onboardText = UILabel()
        onboardText.text = """
        შედი
        აპლიკაციაში
        და იწუწუნე
        რამდენიც გინდა
        """
        onboardText.font = UIFont(name: "FiraGO-Bold", size: 30)
        onboardText.translatesAutoresizingMaskIntoConstraints = false
        onboardText.numberOfLines = 4
        onboardText.textColor = .white
        return onboardText
    }()
    
    let startButton: CustomButton = {
        let startButton = CustomButton()
        startButton.setTitle("დაწყება", for: .normal)
        return startButton
    }()



    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    //MARK: - Functions
    func setupUI(){
        addBackgroundImage()
        addTextOnBackground()
        addStartButton()
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
    func addTextOnBackground(){
        view.addSubview(onboardText)
        NSLayoutConstraint.activate([
            onboardText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            onboardText.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),
            onboardText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        ])
    }
    func addStartButton(){
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
        
        startButton.addAction(UIAction.init(handler: { _ in
            self.redirectToPostsVC()
        }), for: .touchUpInside)
    }
    
    func redirectToPostsVC(){
        let postsVC = PostsViewController()
        navigationController?.pushViewController(postsVC, animated: true)
        navigationController?.setViewControllers([postsVC], animated: true)
//        tabBarController?.navigationItem.setHidesBackButton(true, animated: true)
    }

}

#Preview{
    OnboardingViewController()
}

