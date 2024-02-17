//
//  ViewController.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 16.02.2024.
//

import UIKit

class TriangleController: UIViewController {
    
    //MARK: Creating variables
    let viewSub = TriangleView()
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
    
    
    //MARK: Creating variables
    @objc func calculateTapped() {
        guard let side1 = Double(viewSub.sideOneTextField.text!) else {return}
        guard let side2 = Double(viewSub.sideTwoTextField.text!) else {return}
        guard let side3 = Double(viewSub.sideThreeTextField.text!) else {return}
        
        let summ = model.triangleArea(side1: side1, side2: side2, side3: side3)
        let equilateral = model.isTriangleEquilateral(side1: side1, side2: side2, side3: side3)
        let isosceles = model.isTriangleIsosceles(side1: side1, side2: side2, side3: side3)
        let scalene = model.isTriangleScalene(side1: side1, side2: side2, side3: side3)
 
        if summ.isNaN || summ == 0.0 {
            viewSub.areaInt.text = "No such triangle"
            viewSub.infoLabel.isHidden = true
        } else {
            viewSub.areaInt.text = "\(Float(summ)) cm"
            if equilateral {
                viewSub.infoLabel.text = "This is equilateral triangle."
            } else if isosceles {
                viewSub.infoLabel.text = "This is isosceles triangle."
            } else if scalene {
                viewSub.infoLabel.text = "This is scalene triangle."
            }
            viewSub.infoLabel.isHidden = false
        }

    }
    
    
    //MARK: Creating variables
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

