//
//  SealView.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 17.02.2024.
//

import UIKit

class SealView: UIView {
    
    lazy private var areaLabel: UILabel = {
        let label = UILabel()
        label.text = "Your figure area is:"
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

    
    lazy var sidesSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 4
        slider.maximumValue = 1000
        slider.value = 4
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    
    lazy var sidesCountTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        textfield.isUserInteractionEnabled = false
        textfield.placeholder = "use slider..."
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    lazy var sidesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Sides count:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    lazy var sidesLengthTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "in cm..."
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    lazy var sidesLenghtLabel: UILabel = {
        let label = UILabel()
        label.text = "Sides length:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
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
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        createCalculateButton()
        createSidesSlider()
        createTextFields()
        createLabels()
        createAreaLabel()
        
        backgroundColor = .white
    }
    
    
    private func createCalculateButton() {
        addSubview(calculateButton)
        
        let buttonConstraints = [
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -75),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
        ]
        
        NSLayoutConstraint.activate(buttonConstraints)
    }
    
    
    private func createSidesSlider() {
        addSubview(sidesSlider)
        
        let sliderConstraints = [
            sidesSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            sidesSlider.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -300),
            sidesSlider.heightAnchor.constraint(equalToConstant: 40),
            sidesSlider.widthAnchor.constraint(equalToConstant: 290)
        ]
        
        NSLayoutConstraint.activate(sliderConstraints)
    }
    
    
    private func createTextFields() {
        addSubview(sidesCountTextField)
        addSubview(sidesLengthTextField)
        
        let textFieldConstraints = [
            sidesLengthTextField.trailingAnchor.constraint(equalTo: sidesSlider.trailingAnchor),
            sidesLengthTextField.topAnchor.constraint(equalTo: sidesSlider.bottomAnchor, constant: 42),
            sidesLengthTextField.heightAnchor.constraint(equalToConstant: 34),
            sidesLengthTextField.widthAnchor.constraint(equalToConstant: 150),
            
            sidesCountTextField.trailingAnchor.constraint(equalTo: sidesSlider.trailingAnchor),
            sidesCountTextField.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -40),
            sidesCountTextField.heightAnchor.constraint(equalToConstant: 34),
            sidesCountTextField.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        NSLayoutConstraint.activate(textFieldConstraints)
    }
    
    

    private func createLabels() {
        addSubview(sidesCountLabel)
        addSubview(sidesLenghtLabel)
        
        let triangleLabelsStackConstraints = [
            sidesCountLabel.leadingAnchor.constraint(equalTo: sidesSlider.leadingAnchor),
            sidesCountLabel.centerYAnchor.constraint(equalTo: sidesCountTextField.centerYAnchor),
            sidesCountLabel.heightAnchor.constraint(equalToConstant: 34),
            sidesCountLabel.widthAnchor.constraint(equalToConstant: 150),
            
            sidesLenghtLabel.leadingAnchor.constraint(equalTo: sidesCountLabel.leadingAnchor),
            sidesLenghtLabel.centerYAnchor.constraint(equalTo: sidesLengthTextField.centerYAnchor),
            sidesLenghtLabel.heightAnchor.constraint(equalToConstant: 34),
            sidesLenghtLabel.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        NSLayoutConstraint.activate(triangleLabelsStackConstraints)
    }
    
    
    private func createAreaLabel() {
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
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
