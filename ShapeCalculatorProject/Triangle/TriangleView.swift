//
//  View.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 16.02.2024.
//

import UIKit

class TriangleView: UIView {
    
    //MARK: Creating variables
    lazy private var areaLabel: UILabel = {
        let label = UILabel()
        label.text = "Your triangle area is:"
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
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "This is right triangle."
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var sideOneLabel: UILabel = {
        let label = UILabel()
        label.text = "1st side length:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    lazy var sideTwoLabel: UILabel = {
        let label = UILabel()
        label.text = "2nd side length:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    lazy var sideThreeLabel: UILabel = {
        let label = UILabel()
        label.text = "3rd side length:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    lazy private var triangleLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sideOneLabel, sideTwoLabel, sideThreeLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    lazy var sideOneTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "in cm..."
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        return textfield
    }()
    lazy var sideTwoTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "in cm..."
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        return textfield
    }()
    lazy var sideThreeTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "in cm..."
        textfield.borderStyle = .roundedRect
        textfield.textAlignment = .center
        return textfield
    }()
    lazy private var triangleTextFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sideOneTextField, sideTwoTextField, sideThreeTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 25
        stackView.distribution = .equalSpacing
        return stackView
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

        createCalculateButton()
        createTriangleTextFields()
        createTriangleLabelFields()
        createAreaLabel()
        
        infoLabel.isHidden = true
        backgroundColor = .white
    }
    

    //MARK: Creating top labels
    fileprivate func createAreaLabel() {
        addSubview(areaLabel)
        addSubview(areaInt)
        addSubview(infoLabel)
        
        let labelConstraints = [
            areaLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            areaLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            areaLabel.heightAnchor.constraint(equalToConstant: 50),
            areaLabel.widthAnchor.constraint(equalToConstant: 200),
            
            areaInt.centerXAnchor.constraint(equalTo: centerXAnchor),
            areaInt.topAnchor.constraint(equalTo: areaLabel.bottomAnchor, constant: 0),
            areaInt.heightAnchor.constraint(equalToConstant: 70),
            areaInt.widthAnchor.constraint(equalToConstant: 300),
            
            infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            infoLabel.topAnchor.constraint(equalTo: areaInt.bottomAnchor, constant: 0),
            infoLabel.heightAnchor.constraint(equalToConstant: 50),
            infoLabel.widthAnchor.constraint(equalToConstant: 350),
        ]
        
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    
    //MARK: Creating triangle sides labels
    fileprivate func createTriangleLabelFields() {
        addSubview(triangleLabelStackView)
        
        let triangleLabelsStackConstraints = [
            triangleLabelStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50),
            triangleLabelStackView.centerYAnchor.constraint(equalTo: triangleTextFieldStackView.centerYAnchor),
            triangleLabelStackView.heightAnchor.constraint(equalToConstant: 138),
            triangleLabelStackView.widthAnchor.constraint(equalToConstant: 150)
        ]
        
        NSLayoutConstraint.activate(triangleLabelsStackConstraints)
    }
    
    
    //MARK: Creating triangle textfields
    fileprivate func createTriangleTextFields() {
        addSubview(triangleTextFieldStackView)
        
        let textFieldStackConstraints = [
            triangleTextFieldStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -50),
            triangleTextFieldStackView.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -40),
            triangleTextFieldStackView.heightAnchor.constraint(equalToConstant: 150),
            triangleTextFieldStackView.widthAnchor.constraint(equalToConstant: 150)
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



extension UIButton {
    func setBackgroundColor(_ color: UIColor, forState controlState: UIControl.State) {
        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { _ in
            color.setFill()
            UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        }
        setBackgroundImage(colorImage, for: controlState)
        clipsToBounds = true
    }
}

