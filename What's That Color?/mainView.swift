//
//  mainView.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/12/22.
//

import SwiftUI
import UIColorHexSwift

struct mainView: View
{
    @EnvironmentObject var colorFunc: ColorFunctions
    @State var selectedView = false
    
    func changeNum() -> String
    {
        var X: String
        
        if selectedView == false
        {
            X = "HEX"
        }
        else
        {
           X = "RGB"
        }
        
        return X
    }
    
    @ViewBuilder func changeView(view: String, Color: UIColor) -> some View
    {
        switch view
        {
            case "HEX":
            hexView(Hex: Color.hexString(false))
            case "RGB":
            rgbView(RGB: Color.hexString(false).replacingOccurrences(of: "#", with: ""))
            default:
                EmptyView()
        }
    }
    
    
    
    var body: some View
    {
        ZStack
        {
            Color(colorFunc.backgroundColor).edgesIgnoringSafeArea(.all)
            VStack
            {
                cameraView()
                Button { selectedView.toggle()} label: {
                    changeView(view: changeNum(), Color: colorFunc.backgroundColor)
                }
                .foregroundColor(.black)
                .textSelection(.enabled)
                .padding()
                Spacer()
            }
        }
        .task
        {
            let RGB = colorFunc.backgroundColor.hexString(false).replacingOccurrences(of: "#", with: "")
            colorFunc.Calculate(X: Array(RGB))
        }

    }
}


struct mainView_Previews: PreviewProvider
{
    static var previews: some View
    {
        mainView()
    }
}
