//
//  RecipeViewController.swift
//  Recipe
//
//  Created by Denis on 26/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class RecipeViewController: BaseController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationControllerCreating(imageName: "recipe")
        self.topLabelCreation(text: "Boiling eggs in 7 steps")
        self.setImage(index: index)
        self.view.addSubview(imageView)
        self.setText(index: index)
        self.view.addSubview(textView)
        self.setStepLabel(index: index)
        self.view.addSubview(stepLabel)
        self.backButtonCreation()
        self.backButton.addTarget(self, action: #selector(changeIndex(param:)), for: .touchUpInside)
        self.view.addSubview(backButton)
        self.nextButtonCreation()
        self.nextButton.addTarget(self, action: #selector(changeIndex(param:)), for: .touchUpInside)
        self.view.addSubview(nextButton)
        
        
        
    }
}

//MARK: - Methods
extension RecipeViewController  {
    
    func setImage(index: Int) {
        let imageArray = [UIImage(named: "Step1"),
                          UIImage(named: "Step2"),
                          UIImage(named: "Step3"),
                          UIImage(named: "Step4"),
                          UIImage(named: "Step5"),
                          UIImage(named: "Step6"),
                          UIImage(named: "Step7")
        ]
        self.imageView.image = imageArray[index]
    }
    
    func setText(index: Int) {
        
        let textArray = [
            "Place eggs in the bottom of a saucepan. Be sure not to crowd the eggs in the pan. They should fit comfortably.",
            "Fill the pan with cold water, 1 inch above the eggs.",
            "Bring the water to a rapid boil on the stovetop over high heat.",
            "Once the water comes to a boil, cover the pan with a lid and remove the pan from the heat. Do not lift the lid. Set a timer for the type of boiled egg you want, from 4 minutes to 12 minutes.",
            "Fill a large bowl with ice and water.",
            "When the eggs reach the desired cooking time, use tongs to remove the eggs from the hot water and immerse gently into the prepared ice water to cool, about 10 minutes.",
            "Gently tap the eggs against a hard surface and peel away the shell. Rinse the egg under cold water to remove any bits of shell and pat dry."
        ]
        
        self.textView.font = UIFont(name: "Thonburi", size: 15)
        self.textView.text = textArray[index]
        self.textView.textColor = .black
        self.textView.backgroundColor = .white 
    }
    
    func setStepLabel(index: Int) {
        self.stepLabel.font = UIFont(name: "Thonburi", size: 13)
        self.stepLabel.textColor = .black
        self.stepLabel.text = "Step \(index + 1)"
    }
    
}

//MARK: - Actions
extension RecipeViewController  {
    
    @objc func changeIndex(param: UIButton) {
        if param.isEqual(nextButton) {
            index += 1
        }
        if param.isEqual(backButton) {
            index -= 1
        }
        
        self.setImage(index: index)
        self.setText(index: index)
        self.setStepLabel(index: index)
        
        if index > 5 {
            self.nextButton.isHidden = true
        } else {
            self.nextButton.isHidden = false
        }
        
        if index < 1 {
            self.backButton.isHidden = true
        } else {
            self.backButton.isHidden = false
        }
        
    }
}
