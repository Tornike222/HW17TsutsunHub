//
//  CustomImageButton.swift
//  TsutsunHub
//
//  Created by telkanishvili on 14.04.24.
//

import UIKit

class CustomImageButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        touch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton(){
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
    }
    
    func touch(){
        addAction(UIAction(handler: { _ in
            self.buttonTouchedUp()
        }), for: .touchDown)
        
//        addAction(UIAction(handler: { _ in
//            self.deselectButton()
//        }), for: .touchUpInside)
    }
    var touched = 0

    func buttonTouchedUp(){
        if touched == 0 {
            layer.masksToBounds = true
            layer.cornerRadius = 14
            layer.borderWidth = 3
            let newAlpha = min(CGFloat(layer.opacity * 0.5), 1) // Clamp the value to 1
            touched = 1
            // Retrieve the current border color of the button (if any)
            let currentBorderColor = layer.borderColor
            
            // Convert the CGColor to UIColor (if the current border color exists)
            let currentUIColor = currentBorderColor != nil ? UIColor(cgColor: currentBorderColor!) : UIColor.black
            
            // Modify the current color's alpha with the calculated alpha value
            let newBorderColor = currentUIColor.withAlphaComponent(newAlpha)
            
            // Set the new border color to the button's layer
            layer.borderColor = newBorderColor.cgColor
            layer.opacity = 0.6
            
        } else if touched == 1 {
            layer.borderWidth = 0
            layer.opacity = 0.6

            touched = 0

        }

    }
    
    func deselectButton(){
        layer.borderWidth = 0
    }
    
}
