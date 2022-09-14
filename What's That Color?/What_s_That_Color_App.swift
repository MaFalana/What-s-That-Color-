//
//  What_s_That_Color_App.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/12/22.
//

import SwiftUI

@main
struct What_s_That_Color_App: App
{
    @StateObject var colorFunc = ColorFunctions.shared
    @StateObject var paletteFunc = PaletteManager.shared
    
    var body: some Scene
    {
        WindowGroup
        {
            tabView()
                .environmentObject(colorFunc)
                .environmentObject(paletteFunc)
            //.textSelection(.enabled)
        }
    }
}
