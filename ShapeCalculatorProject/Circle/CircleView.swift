//
//  CircleView.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 17.02.2024.
//


import UIKit

class CircleView: UIView {
    
    //MARK: Creating variables
    lazy private var areaLabel: UILabel = {
        let label = UILabel()
        label.text = "Your circle area is:"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    lazy var areaInt: UILabel = {
        let label = UILabel()
        label.text = "0 cm"
        label.font = .systemFont(ofSize: 60, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var radiusLabel: UILabel = {
        let label = UILabel()
        label.text = "Radius length:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    lazy var radiusTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "in cm..."
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setBackgroundColor(.systemYellow, forState: .highlighted)
        return button
    }()
    
    
    //MARK: Initializing view
    override init(frame: CGRect) {
        super.init(frame: frame)

        createAreaLabel()
        createCalculateButton()
        createCircleTextField()
        createRadiusLabel()
        
        backgroundColor = .white
    }
    

    //MARK: Creating top labels
    fileprivate func createAreaLabel() {
        addSubview(areaLabel)
        addSubview(areaInt)
        
        let labelConstraints = [
            areaLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            areaLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            areaLabel.heightAnchor.constraint(equalToConstant: 50),
            areaLabel.widthAnchor.constraint(equalToConstant: 200),
            
            areaInt.centerXAnchor.constraint(equalTo: centerXAnchor),
            areaInt.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 0),
            areaInt.heightAnchor.constraint(equalToConstant: 70),
            areaInt.widthAnchor.constraint(equalToConstant: 300)
        ]
        
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    
    //MARK: Creating radius label
    fileprivate func createRadiusLabel() {
        addSubview(radiusLabel)
        
        let triangleLabelsStackConstraints = [
            radiusLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            radiusLabel.centerYAnchor.constraint(equalTo: radiusTextField.centerYAnchor),
            radiusLabel.heightAnchor.constraint(equalToConstant: 34),
            radiusLabel.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        NSLayoutConstraint.activate(triangleLabelsStackConstraints)
    }
    
    
    //MARK: Creating radius textfield
    fileprivate func createCircleTextField() {
        addSubview(radiusTextField)
        
        let textFieldStackConstraints = [
            radiusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            radiusTextField.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -40),
            radiusTextField.heightAnchor.constraint(equalToConstant: 34),
            radiusTextField.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        NSLayoutConstraint.activate(textFieldStackConstraints)
    }
    
    
    //MARK: Creating calculate button
    fileprivate func createCalculateButton() {
        addSubview(calculateButton)
        
        let buttonConstraints = [
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -75),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
