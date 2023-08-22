//
//  File.swift
//  
//
//  Created by Qazi Mudassar on 11/02/2023.
//
import SwiftUI

public struct HideNavigationBar : ViewModifier {
    
    public func body(content: Content) -> some View {
        content
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

extension View {
    
    var hideNavigationBar: some View {
        
        modifier(HideNavigationBar())
    }
}
