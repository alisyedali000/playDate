//
//  APpleLoginCheck.swift
//  PlayDate
//
//  Created by Ali Syed on 24/08/2023.
//

import SwiftUI

struct APpleLoginCheck: View {
    

    
    var body: some View {
        
        Button {
          
        } label: {
            Text("Apple sign in")
                .foregroundColor(.white)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.black)
                }
        }

        
    }
    

}

struct APpleLoginCheck_Previews: PreviewProvider {
    static var previews: some View {
        APpleLoginCheck()
    }
}
