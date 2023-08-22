//
//  AppButton.swift
//  PlayDate
//
//  Created by عادل🫥 on 06/04/2023.
//

import SwiftUI

struct AppButton: View {
    
    var title: String
    var action: () -> Void
    
    var body: some View {
        loadView()
    }
}


extension AppButton {
    
    func loadView() -> some View {
        Button {
           action()
        } label: {
            ZStack {
                
                Image("buttonImage")
                    .resizable()
                    .frame(height: 60)
                
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.custom(DMSans.bold.rawValue, size: 20))
                   
            }
        }

    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(title: "Button", action: {})
    }
}
