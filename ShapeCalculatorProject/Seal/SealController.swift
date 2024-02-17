//
//  SealViewController.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 17.02.2024.
//

import UIKit

class SealController: UIViewController {
    
    //MARK: Creating variables
    let viewSub = SealView()
    let model = FigureAreas()
    var lengthArray = [Double]()
    
    
    //MARK: loadView
    override func loadView() {
        super.loadView()
        view = viewSub
    }

    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardObserver()
        viewSub.sidesSlider.addTarget(self, action: #selector(sliderChanges), for: .valueChanged)
        viewSub.sidesLengthTextField.addTarget(self, action: #selector(openLengthAlert), for: .allEditingEvents)
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
    
    
    //MARK: Slider value rounding and setting value in textfield
    @objc func sliderChanges(sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        
        viewSub.sidesCountTextField.text = "\(Int(sender.value))"
    }

    
    //MARK: Setting up sides count method
    @objc func openLengthAlert() {
        let alertController = UIAlertController(title: "Enter sides length", message: nil, preferredStyle: .alert)
        
        let value = Int(viewSub.sidesSlider.value)
        for i in value {
            alertController.addTextField { textField in
                textField.placeholder = "Side #\(i + 1) length in cm..."
            }
        }
        
        alertController.addAction(UIAlertAction(title: "Done", style: .cancel, handler: { [self] action in
            guard let rowCount = alertController.textFields else {return}
            
            if rowCount.isEmpty == false {
                for textField in rowCount {
                    if let text = textField.text, !text.isEmpty { lengthArray.append(Double(text)!) }
                }
            }
            
            let result = model.calculatePolygonArea(numberOfSides: Int(viewSub.sidesSlider.value), sideLengths: lengthArray)
            if result == 0 { viewSub.areaInt.text = "Input error"} else { viewSub.areaInt.text = "\(result) cm" }
            lengthArray.removeAll()
        }))
        
        self.present(alertController, animated: true)
    }
}


extension Int: Sequence {
    public func makeIterator() -> CountableRange<Int>.Iterator {
        return (0..<self).makeIterator()
    }
}
