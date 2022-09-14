//
//  Backend Functions.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/12/22.
//

import Foundation
import UIKit

class ColorFunctions: ObservableObject
{
    static let shared = ColorFunctions()
    var digits: [Character : Int] = [
                    "0": 0,
                    "1": 1,
                    "2": 2,
                    "3": 3,
                    "4": 4,
                    "5": 5,
                    "6": 6,
                    "7": 7,
                    "8": 8,
                    "9": 9,
                    "A": 10,
                    "B": 11,
                    "C": 12,
                    "D": 13,
                    "E": 14,
                    "F": 15
    ]
    @Published var backgroundColor: UIColor = UIColor(red: 255/255, green: 114/255, blue: 118/255, alpha: 1)
    @Published var r: Int = 0
    @Published var g: Int = 0
    @Published var b: Int = 0
    @Published var a: CGFloat = 1
    
    func Calculate(X: [Character] )
    {
        if (r == 0) && (g == 0) && (b == 0)
        {
            r = get255Value(A: X[0], B: X[1])
            g = get255Value(A: X[2], B: X[3])
            b = get255Value(A: X[4], B: X[5])
        }
        else
        {
            r = r
            g = g
            b = b
        }
    }
    
    func get255Value(A: Character, B: Character) -> Int //Function to get RGB Values
    {
        //Get decimal value
        var decimalValue1 = getDecimal(Value: A)
        let decimalValue2 = getDecimal(Value: B)
        
        //Multiply first decimal value by 16
        decimalValue1 *= 16

        //Add passed values together
        decimalValue1 += decimalValue2
        
        //Return sum
        return decimalValue1
    }

    func getDecimal(Value: Character) -> Int //Function to obtain decimal values
    {
        // Convert
        let Decimal = digits[Value]!
        
        // return val
        return Decimal
    }
    
    func changeColor() // Function to update background color
    {
        let r: CGFloat = CGFloat(r)/255
        let g: CGFloat = CGFloat(g)/255
        let b: CGFloat = CGFloat(b)/255
        
        backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a)
        PaletteManager.shared.selectedPalette.getColor()
    }
    
}
