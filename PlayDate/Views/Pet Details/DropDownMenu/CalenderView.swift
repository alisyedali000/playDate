//
//  CalenderView.swift
//  PlayDate
//
//  Created by Aadil on 09/05/2023.
//

import SwiftUI

struct CalenderView: View {
    @Binding var age: Date
    var body: some View {
       loadView()
    }
}
extension CalenderView{
    func loadView() -> some View{
        VStack{
            VStack {
                       DatePicker("", selection: $age, in: ...Date()).datePickerStyle(GraphicalDatePickerStyle())
                           .padding()
                           .padding([.top], 50)

                       Spacer()
                   }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView(age: .constant(Date()))
    }
}
