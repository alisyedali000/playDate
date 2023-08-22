//
//  LoaderView.swift
//  API
//
//  Created by Aadil on 19/05/2023.
//

import SwiftUI

struct LoaderView: View {
    @Binding var isLoading : Bool
    
    var body: some View {
        VStack {
            
            if isLoading {
                
                ZStack {
                    
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2)
                        .foregroundColor(.white)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.gray.opacity(0.7))
                                .frame(width: 100, height: 100)
                        }
                }
            }
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isLoading: .constant(true))
    }
}

