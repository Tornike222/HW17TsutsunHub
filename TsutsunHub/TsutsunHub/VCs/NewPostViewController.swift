//
//  NewPostViewController.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

class NewPostViewController: UIViewController {
    
    var selectedIcon: UIButton? = nil
    
    //MARK: - UIDesign variables
    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "BlueBackground")
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.backgroundColor = .black
        return backgroundImage
    }()
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "სათაური"
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "FiraGO-Regular", size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    let titleInputField: CustomTextField = {
        let titleInputField = CustomTextField()
        titleInputField.placeholder = "მაგ: პანიკა, დახმარება მჭირდება"
        return titleInputField
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "აღწერა"
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont(name: "FiraGO-Regular", size: 20)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    let descriptionInputField: CustomTextField = {
        let descriptionInputField = CustomTextField()
        descriptionInputField.placeholder = "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ"
        return descriptionInputField
    }()
    
    let iconLabel: UILabel = {
        let iconLabel = UILabel()
        iconLabel.text = "აირჩიეთ აიქონი"
        iconLabel.textColor = .white
        iconLabel.font = UIFont(name: "FiraGO-Regular", size: 20)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        return iconLabel
    }()
    
    let firstSpacer: UIButton = {
        let firstSpacer = UIButton()
        firstSpacer.translatesAutoresizingMaskIntoConstraints = false
        return firstSpacer
    }()
    
    let secondSpacer: UIButton = {
        let secondSpacer = UIButton()
        secondSpacer.translatesAutoresizingMaskIntoConstraints = false
        return secondSpacer
    }()
    
    let redIcon: UIButton = {
        let redIcon = UIButton()
        redIcon.setImage(UIImage(named: "Red") ?? UIImage(), for: .normal)
        redIcon.tag = 1
        return redIcon
    }()
    
    let purpleIcon: UIButton = {
        let purpleIcon = UIButton()
        purpleIcon.setImage(UIImage(named: "Purple") ?? UIImage(), for: .normal)
        purpleIcon.tag = 2
        return purpleIcon
    }()
    
    let greenIcon: UIButton = {
        let greenIcon = UIButton()
        greenIcon.setImage(UIImage(named: "Green") ?? UIImage(), for: .normal)
        greenIcon.tag = 3
        return greenIcon
    }()
    
    let yellowIcon: UIButton = {
        let yellowIcon = UIButton()
        yellowIcon.setImage(UIImage(named: "Yellow") ?? UIImage(), for: .normal)
        yellowIcon.tag = 4
        return yellowIcon
    }()
    
    let postStackView: UIStackView = {
        let postStackView = UIStackView()
        postStackView.axis = .vertical
        postStackView.spacing = 20
        postStackView.distribution = .fillProportionally
        postStackView.translatesAutoresizingMaskIntoConstraints = false
        return postStackView
    }()
    
    let titleInputsStackView: UIStackView = {
        let titleInputsStackView = UIStackView()
        titleInputsStackView.axis = .vertical
        titleInputsStackView.spacing = 10
        titleInputsStackView.translatesAutoresizingMaskIntoConstraints = false
        return titleInputsStackView
    }()
    
    let descriptionInputsStackView: UIStackView = {
        let descriptionInputsStackView = UIStackView()
        descriptionInputsStackView.axis = .vertical
        descriptionInputsStackView.spacing = 10
        descriptionInputsStackView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionInputsStackView
    }()
    
    let iconsMainStackView: UIStackView = {
        let iconsMainStackView = UIStackView()
        iconsMainStackView.axis = .vertical
        iconsMainStackView.spacing = 15
        iconsMainStackView.translatesAutoresizingMaskIntoConstraints = false
        return iconsMainStackView
    }()
    
    let iconsStackView: UIStackView = {
        let iconsStackView = UIStackView()
        iconsStackView.axis = .horizontal
        iconsStackView.spacing = 20
        iconsStackView.distribution = .equalCentering
        iconsStackView.alignment = .center
        iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        return iconsStackView
    }()
    
    let addButton: CustomButton = {
        let addButton = CustomButton()
        addButton.setTitle("დამატება", for: .normal)
        addButton.backgroundColor = #colorLiteral(red: 0, green: 0.6093050241, blue: 0.06142415851, alpha: 1)
        return addButton
    }()
    
    
    //MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Functions
    func setupUI(){
        hideTopNavigationBar()
        addBackgroundImage()
        addPostStackView()
        addChildStackViewsToPostSV()
        addTitleInputsToSV()
        addDescriptionInputsToSV()
        addIconsSVToIconMainSV()
        addRedIconToIconsSV()
        addPurpleIconToIconsSV()
        addGreenIconToIconsSV()
        addYellowIconToIconsSV()
        addAddingButton()
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
    
    func addPostStackView(){
        view.addSubview(postStackView)
        NSLayoutConstraint.activate([
            postStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            postStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33),
            postStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            postStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
    }
    
    func addChildStackViewsToPostSV(){
        postStackView.addArrangedSubview(titleInputsStackView)
        postStackView.addArrangedSubview(descriptionInputsStackView)
        postStackView.addArrangedSubview(iconsMainStackView)

        titleInputsStackView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        descriptionInputsStackView.setContentHuggingPriority(.defaultHigh, for: .vertical)

    }
    //firstTwoInputsStackView ჩამატებულ სტეკვიუში ვამატებ სათაურის ლეიბლს და ინფუთ ფილდს
    func addTitleInputsToSV(){
        titleInputsStackView.addArrangedSubview(titleLabel)
        titleInputsStackView.addArrangedSubview(titleInputField)
        titleInputField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    //secondTwoInputsStackView ჩამატებულ სტეკვიუში ვამატებ აღწერის ლეიბლს და ინფუთ ფილდს
    func addDescriptionInputsToSV(){
        descriptionInputsStackView.addArrangedSubview(descriptionLabel)
        descriptionInputsStackView.addArrangedSubview(descriptionInputField)
        descriptionInputField.heightAnchor.constraint(equalToConstant: 45).isActive = true

    }
    
    func addIconsSVToIconMainSV(){
        iconsMainStackView.addArrangedSubview(iconLabel)
        iconsMainStackView.addArrangedSubview(iconsStackView)
//        iconsStackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func addRedIconToIconsSV(){
        iconsStackView.addArrangedSubview(firstSpacer)
        iconsStackView.addArrangedSubview(redIcon)
        
        NSLayoutConstraint.activate([
            firstSpacer.widthAnchor.constraint(equalToConstant: 20),
            firstSpacer.heightAnchor.constraint(equalToConstant: 30),
            redIcon.widthAnchor.constraint(equalToConstant: 40),
            redIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        redIcon.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        redIcon.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside) //ეს კონკრეტულები objc გარეშე არ გამოდიოდა, სხვაგან არსად მაქ გამოყენებული
    }
    
    func addPurpleIconToIconsSV(){
        iconsStackView.addArrangedSubview(purpleIcon)
        
        NSLayoutConstraint.activate([
            purpleIcon.widthAnchor.constraint(equalToConstant: 40),
            purpleIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        purpleIcon.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        purpleIcon.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    }
    
    func addGreenIconToIconsSV(){
        iconsStackView.addArrangedSubview(greenIcon)
        
        NSLayoutConstraint.activate([
            greenIcon.widthAnchor.constraint(equalToConstant: 40),
            greenIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        greenIcon.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        greenIcon.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    }
    
    func addYellowIconToIconsSV(){
        iconsStackView.addArrangedSubview(yellowIcon)
        iconsStackView.addArrangedSubview(secondSpacer)
        
        NSLayoutConstraint.activate([
            secondSpacer.widthAnchor.constraint(equalToConstant: 20),
            secondSpacer.heightAnchor.constraint(equalToConstant: 30),
            yellowIcon.widthAnchor.constraint(equalToConstant: 40),
            yellowIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        greenIcon.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        yellowIcon.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    }
    
    func addAddingButton(){
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
        addButton.addAction(UIAction(handler: { _ in
            self.clickedAddButton()
        }), for: .touchUpInside)

    }
    
    func clickedAddButton(){
        let icon: Icon
        if let selectedIcon = selectedIcon?.tag,
           let title = titleInputField.text,
           title.isEmpty == false,
           let description = descriptionInputField.text,
           description.isEmpty == false {
            
            switch selectedIcon {
            case 1:
                icon = .red
            case 2:
                icon = .purple
            case 3:
                icon = .green
            case 4:
                icon = .yellow
            default:
                return
            }
            existingPosts.append(PostModel(icon: icon, title: title, description: description))
            
            let alert = UIAlertController(title: "გილოცავ 🎉", message: "წუწუნპოსტი წარმატებით დაემატა", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "კარგი", style: UIAlertAction.Style.default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            let alertOfProblem = UIAlertController(title: "პოსტი ვერ დაემატა", message: "გადაამოწმე შეყვანილი მნიშვნელობები და სცადე ხელახლა", preferredStyle: UIAlertController.Style.alert)
            alertOfProblem.addAction(UIAlertAction(title: "კარგი", style: UIAlertAction.Style.default, handler: .none))
            self.present(alertOfProblem, animated: true, completion: nil)
        }
        
    }
    
     @objc func buttonClicked(_ sender: UIButton) {
        deselectAllButtons()
        
        sender.layer.masksToBounds = true
        sender.layer.cornerRadius = 14
        sender.layer.borderWidth = 3
        let newAlpha = min(CGFloat(sender.layer.opacity * 0.5), 1)
        let currentBorderColor = sender.layer.borderColor
        let currentUIColor = currentBorderColor != nil ? UIColor(cgColor: currentBorderColor!) : UIColor.black
        let newBorderColor = currentUIColor.withAlphaComponent(newAlpha)
        sender.layer.borderColor = newBorderColor.cgColor
        sender.layer.opacity = 0.6
        
        selectedIcon = sender
       
    }
    
    func deselectAllButtons() {
        deselect(button: redIcon)
        deselect(button: purpleIcon)
        deselect(button: greenIcon)
        deselect(button: yellowIcon)
    }
    
    func deselectAllTextFields(){
        titleInputField.textFieldTouchedUp()
        descriptionInputField.textFieldTouchedUp()
    }
    
    func deselect(button: UIButton){
        button.layer.borderWidth = 0
        button.layer.opacity = 1
    }
    
}
#Preview{
    NewPostViewController()
}
