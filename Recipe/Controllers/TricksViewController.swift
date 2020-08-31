//
//  TricksViewController.swift
//  Recipe
//
//  Created by Denis on 26/8/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class TricksViewController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationControllerCreating(imageName: "tricks")
        
        //share button
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareInfo))
        
        self.topLabelCreation(text: "3 tricks for boiling eggs")
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
extension TricksViewController  {
    
    func setImage(index: Int) {
        let imageArray = [UIImage(named: "Trick1"),
                          UIImage(named: "Trick2"),
                          UIImage(named: "Trick3")
        ]
        self.imageView.image = imageArray[index]
    }
    
    func setText(index: Int) {
        
        let textArray = [
            "Soft Boiled (runny or very soft yolk) – 4 to 6 minutes \nHard Boiled (solid cooked yolk) – 8 to 12 minutes",
            "There are many reasons why eggs do not peel smoothly. Fresh eggs are difficult to peel, while older eggs peel easier. Crack the eggs all over before putting them in the ice bath.",
            "WHY DOES MY YOLK HAVE A GREEN CIRCLE AROUND IT? \nUnfortunately, a green yolk means you’ve overcooked your eggs."
        ]
        
        self.textView.font = UIFont(name: "Thonburi", size: 15)
        self.textView.text = textArray[index]
        self.textView.textColor = .black
        self.textView.backgroundColor = .white 
    }
    
    func setStepLabel(index: Int) {
        self.stepLabel.font = UIFont(name: "Thonburi", size: 12)
        self.stepLabel.textColor = .black
        self.stepLabel.text = "Trick \(index + 1)"
    }
    
}

//MARK: - Actions
extension TricksViewController  {
    
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
        
        if index > 1 {
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
    
    
    @objc func shareInfo() {
        let activityViewController = UIActivityViewController(activityItems: [self.imageView.image!, self.textView.text ?? "nil"], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}
