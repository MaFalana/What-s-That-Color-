//
//  Palette Functions.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/13/22.
//

import Foundation
import SwiftUI

protocol Palette
{
    var name: String {get set}
    var colorArray: [UIColor] {get set}
    func getColor()
    
    //might need to make some kind of color struct and put it into an array
}

//Monochromatic
final class Monochromatic: Palette
{
    //@EnvironmentObject var colorFunc: ColorFunctions
    
    var name: String = "Monochromatic"
    
    var colorArray: [UIColor] = []
    
    
    
    func getColor()
    {
        //Something with Hex values
        print(name)
        getPallete()
        
        //Chosen color should be in middle
        
        // if able colors should go three shades up and down from this
    }
    
    func changeColor(a: CGFloat) -> UIColor // Function to update background color
    {
        let r: CGFloat = CGFloat(ColorFunctions.shared.r)/255
        let g: CGFloat = CGFloat(ColorFunctions.shared.g)/255
        let b: CGFloat = CGFloat(ColorFunctions.shared.b)/255
        
        let backgroundColor = UIColor(red: r, green: g, blue: b, alpha: a)
        
        return backgroundColor
    }
    
    func getPallete()
    {
        var X: CGFloat = 0
        var newAccent: UIColor
        
        while X <= 1
        {
            newAccent = changeColor(a: X)
            colorArray.append(newAccent)
            X += 0.2
        }
    }
}

//Complementary
final class Complementary: Palette
{
    var name: String = "Complementary"
    
    var colorArray: [UIColor] = []
    
    func getColor()
    {
        //Something with Hex values
        print(name)
    }
}

//Triadic
final class Triadic: Palette
{
    var name: String = "Triadic"
    
    var colorArray: [UIColor] = []
    
    func getColor()
    {
        //Something with Hex values
        print(name)
    }
}

//Tetradic

//Square*

//Analogous

//Split-Complementary


class PaletteManager: ObservableObject
{
    @AppStorage("selectedPalette") var paletteSelected = 0
    static let shared = PaletteManager()
    
    public var palettes: [Palette] = [
        Monochromatic(),
        Complementary(),
        Triadic(),
        //Tetradic(),
        //Square(),
        //Analogous(),
        //Split-Complementary()

    ]
    
    @Published var selectedPalette: Palette = Monochromatic()
    
    init() { getPalette() }
    
    public func updatePalette(_ palette: Int)
    {
        self.selectedPalette = self.palettes[palette]
        self.paletteSelected = palette
    }
    
    func getPalette()
    {
        self.selectedPalette = self.palettes[paletteSelected]
        self.selectedPalette.getColor()
    }
}
