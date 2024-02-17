//
//  Model.swift
//  ShapeCalculatorProject
//
//  Created by Gamid Gapizov on 16.02.2024.
//

import Foundation

class FigureAreas {
    
    func circleArea(radius: Double) -> Double { return .pi * radius * radius }
    
    func triangleArea(side1: Double, side2: Double, side3: Double) -> Double {
        let semiPerimeter = (side1 + side2 + side3) / 2.0
        return sqrt(semiPerimeter * (semiPerimeter - side1) * (semiPerimeter - side2) * (semiPerimeter - side3))
    }
    
    func calculatePolygonArea(numberOfSides: Int, sideLengths: [Double]) -> Double {
        if numberOfSides >= 3 {
            if sideLengths.count == numberOfSides {
                let interiorAngle = (Double(numberOfSides) - 2) * .pi / Double(numberOfSides)
                let apothem = sideLengths[0] / (2 * tan(.pi / Double(numberOfSides)))
                
                let area = Double(numberOfSides) * apothem * sideLengths[0] / 2.0
                return area
            }
        } else {
            return 0
        }
        return 0
    }
    
    func isTriangleEquilateral(side1: Double, side2: Double, side3: Double) -> Bool { return side1 == side2 && side2 == side3 }

    func isTriangleIsosceles(side1: Double, side2: Double, side3: Double) -> Bool { return side1 == side2 || side2 == side3 || side3 == side1 }

    func isTriangleScalene(side1: Double, side2: Double, side3: Double) -> Bool { return !isTriangleEquilateral(side1: side1, side2: side2, side3: side3) && !isTriangleIsosceles(side1: side1, side2: side2, side3: side3) }
}
