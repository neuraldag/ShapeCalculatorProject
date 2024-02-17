//
//  CircleViewController.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 17.02.2024.
//

import UIKit

class CircleController: UIViewController {
    
    //MARK: Creating variables
    let viewSub = CircleView()
    let model = FigureAreas()
    
    
    //MARK: loadView
    override func loadView() {
        super.loadView()
        view = viewSub
    }
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardObserver()
        viewSub.calculateButton.addTarget(self, action: #selector(calculateTapped), for: .touchUpInside)
    }
    
    
    //MARK: Adjust height when keyboard appears
    func keyboardObserver() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardDidShowNotification, object: nil, queue: nil) { nc in
            UIView.animate(withDuration: 0.3) { self.view.frame.origin.y = -200.0 }
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { nc in
            UIView.animate(withDuration: 1) { self.view.frame.origin.y = 0.0 }
        }
    }
    
    
    @objc func calculateTapped() {
        guard let radius = Double(viewSub.radiusTextField.text!) else { return }
        
        let summ = model.circleArea(radius: radius)
        if summ.isNaN || summ == 0.0 {
            viewSub.areaInt.text = "No such circle"
        } else {
            viewSub.areaInt.text = "\(Float(summ)) cm"
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}
