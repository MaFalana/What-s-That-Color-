//
//  miscViews.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/13/22.
//

import Foundation
import SwiftUI
import UIColorHexSwift

struct colorView: View
{
    let A: UIColor
    //let B: String
    
    var body: some View
    {
        ZStack
        {
            Color(A).edgesIgnoringSafeArea(.all)
            Text(A.hexString(false)).font(.largeTitle).padding()
        }
    }
    
}


struct hexView: View
{
    let Hex: String

    var body: some View
    {
        Text(Hex)
            .font(.largeTitle)
            .textSelection(.enabled)
    }
}

struct rgbView: View
{
    @EnvironmentObject var colorFunc: ColorFunctions
    let RGB: String
    
    var body: some View
    {
        
        Text("\(colorFunc.r) \(colorFunc.g) \(colorFunc.b)")
            .font(.largeTitle)
            .textSelection(.enabled)
    }
    
}
