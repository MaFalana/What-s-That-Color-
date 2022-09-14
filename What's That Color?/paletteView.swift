//
//  paletteView.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/13/22.
//

import SwiftUI

struct paletteView: View
{
    @EnvironmentObject var colorFunc: ColorFunctions
    @EnvironmentObject var paletteFunc: PaletteManager
    @State var selectedPalette: Int = 0
    @State var selectedItem: String = ""
    var body: some View
    {
        ZStack
        {
            Color(colorFunc.backgroundColor).edgesIgnoringSafeArea(.all)
            VStack
            {
                Picker("Palettes", selection: $selectedPalette)
                {
                    ForEach(0..<paletteFunc.palettes.count)
                    {
                        i in
                        Text(paletteFunc.palettes[i].name)
                        //buttonRow(Name: paletteFunc.palettes[i].name, Value: i, selectedItem: $selectedItem)
                    }
                }
                .pickerStyle(.menu)
                .onReceive([self.selectedPalette].publisher.first())
                {
                    value in
                    //paletteFunc.updatePalette(value)
                    paletteFunc.selectedPalette.getColor()
                }
                Spacer()
                VStack
                {
                    ForEach(0..<paletteFunc.selectedPalette.colorArray.count)
                    {
                        i in
                        colorView(A: paletteFunc.selectedPalette.colorArray[i])
                    }

                }
            }
            
        }
        
        //pi
        //Color Scheme then Color Pallete
    }
}


struct buttonRow: View
{
    let Name: String
    let Value: Int
    @Binding var selectedItem: String
    @EnvironmentObject var paletteFunc: PaletteManager
   
    
    var body: some View
    {
        HStack
        {
            Text(Name)
        }.contentShape(Rectangle()).onTapGesture
        {
            self.selectedItem = self.Name
            withAnimation{ paletteFunc.updatePalette(Value) }
        }//.task { self.selectedItem = paletteFunc.selectedPalette.name }
    }
}
