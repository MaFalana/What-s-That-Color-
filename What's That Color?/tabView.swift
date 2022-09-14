//
//  tabView.swift
//  What's That Color?
//
//  Created by Malik Falana on 9/13/22.
//

import SwiftUI

struct tabView: View
{
    @State var selectedTab = 0
    
    var body: some View
    {
        TabView(selection: $selectedTab)
        {
            mainView().tag(0)
            
            paletteView().tag(1)
        }
        .edgesIgnoringSafeArea(.all)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

