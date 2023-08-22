//
//  OTPTextField.swift
//  PlayDate
//
//  Created by عادل🫥 on 07/04/2023.
//

import SwiftUI

struct OTPTextField: View {
    @Binding var OTPText: String
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {
       
        loadView()
    }
}
extension OTPTextField{
    
    func loadView()->some View{
        VStack(){
            
            OTPView()
            
        }
        
        
    }
    func OTPView()->some View{
       
        HStack() {
            ForEach(0..<4, id:\.self){ index in
                OTPBoxes(index)
            }
        }
        .background(content:{
            TextField("", text: $OTPText.limit(4))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .frame(width: 1,height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
        })
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        
        }
        
    @ViewBuilder
    func OTPBoxes(_ index: Int)->some View{
        ZStack{
            if OTPText.count > index{
                let startIndex = OTPText.startIndex
                let charIndex = OTPText.index(startIndex,offsetBy: index)
                let charToString = String(OTPText[charIndex])
                Text(charToString)
            }else{
                Text(" ")
            }
        }
        .frame(width:50,height: 50)
        .background{
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.newTFColor,lineWidth: 11)
                .background(Color.newTFColor)
        }.padding()
        
    }
        
    }
extension View{
    func disablewithOpacity(_ condition: Bool)-> some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.6:1)
    }
}

extension Binding where Value == String{
    func limit(_ length:Int)->Self{
        DispatchQueue.main.async {
            self.wrappedValue = String(self.wrappedValue.prefix(length))
        }
        return self
    }
}
        
    struct OTPTextField_Previews: PreviewProvider {
        static var previews: some View {
            OTPTextField(OTPText: .constant("1234"))
        }
    }

