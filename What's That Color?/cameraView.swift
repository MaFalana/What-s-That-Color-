//
//  cameraView.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/12/22.
//

import SwiftUI

struct cameraView: View
{
    @EnvironmentObject var colorFunc: ColorFunctions
    var captureButton: some View {
            Button(action: {
                //model.capturePhoto()
                colorFunc.g += 1; colorFunc.changeColor()
            }, label: {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .overlay(
                        Circle()
                            .stroke(Color(colorFunc.backgroundColor).opacity(0.8), lineWidth: 2)
                            .frame(width: 65, height: 65, alignment: .center)
                    )
            })
        }
    
    var flipButton: some View {
        Button(action: { colorFunc.b += 1; colorFunc.changeColor()
                //model.flipCamera()
            }, label: {
                Circle()
                    .foregroundColor(Color.gray.opacity(0.2))
                    .frame(width: 45, height: 45, alignment: .center)
                    .overlay(
                        Image(systemName: "camera.rotate.fill")
                            .foregroundColor(.white))
            })
        }
    
    var body: some View
    {
        VStack
        {
            HStack
            {
                Button { print("Settings") }
                label:
                {
                    Image(systemName: "gear").imageScale(.large)
                }
            }.foregroundColor(.black)
            
            Circle().frame(width: UIScreen.main.bounds.width)
            
            HStack
            {
                Button { print("this works") }
                label:
                {
                    Image(systemName: "camera").imageScale(.large)
                }
                Spacer()
                captureButton
                Spacer()
                flipButton
                
            }//.foregroundColor(.black)
            .padding(.horizontal, 20)
            Spacer().padding()
        }
    }
}

