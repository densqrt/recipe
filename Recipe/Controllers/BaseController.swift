//
//  BaseController.swift
//  Recipe
//
//  Created by Denis on 26/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    var index = 0
    let imageView = UIImageView(frame: CGRect(x: 37, y: 135, width: 300, height: 240))
    let textView = UITextView(frame: CGRect(x: 37, y: 420, width: 300, height: 110))
    let stepLabel = UILabel(frame: CGRect(x: 166, y: 557, width: 42, height: 30))
    let backButton = UIButton(frame: CGRect(x: 136, y: 560, width: 22, height: 22))
    let nextButton = UIButton(frame: CGRect(x: 216, y: 560, width: 22, height: 22))

    
    func navigationControllerCreating(imageName: String) {
        
        //creating title image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        self.navigationItem.titleView = imageView
        
        //making transparent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        
    }
    
    func topLabelCreation(text: String) {
        
        let label = UILabel(frame: CGRect(x: 35, y: 91, width: 304, height: 28))
        label.font = UIFont(name: "Rockwell", size: 23)
        label.textAlignment = .center
        label.text = text
        self.view.addSubview(label)
        
    }
    
    func backButtonCreation() {
        backButton.setImage(UIImage(named: "left"), for: .normal)
        backButton.isHidden = true
    }
    
    func nextButtonCreation() {
        nextButton.setImage(UIImage(named: "right"), for: .normal)
        nextButton.isHidden = false
    }
    
    
}
