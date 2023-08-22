//
//  ResetPasswordView.swift
//  PlayDate
//
//  Created by عادل🫥 on 07/04/2023.
//

import SwiftUI
import UIKit
struct ResetPasswordView: View {
    @StateObject var vm = ResetViewModel()
    @Environment (\.dismiss) var dismiss
    @State  var text = ""
    @State private var isActive = false
    var userId: Int
    
    init(userId: Int) {
        self.userId = userId
    }
    
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $vm.showLoader)
        }
        
            .alert("PlayDate Error", isPresented: $vm.showError) {
                
            } message: {
                Text(vm.errorMessage)
            }
            .onReceive(RootController.auth) { newValue in
                print(newValue)
                isActive = newValue
            }
           
            
    }
}

extension ResetPasswordView{
    func loadView()->some View{
        VStack(spacing:22){
            ZStack {
                HStack {
                    CustomNavButton(title: "")
                    
                }.padding(.horizontal)
            }
            ResetImage()
            ResetText()
            ResetTextField()
            Spacer()
            
            AppButton(title:"Change Password"){
                
                if vm.isResetValid(){
                    Task{
                        await vm.updatePasswordAPI(userId: userId)
                        DispatchQueue.main.async {
                            RootController.auth.send(false)
                           
                        
                         
                        }
                  
                    }
                   
                    
                }
                
            }
            
            
            
        }.padding()
            .hideNavigationBar
        
    }
    
    
    
    
    func ResetTextField()->some View{
        VStack(spacing:24){
            PasswordTextfield(password: $vm.password, placeHolder: "Enter New Password")
            PasswordTextfield(password: $vm.confromPassword, placeHolder: "Retype New Password")
        }.padding(.top, 30)
    }
    
    func ResetImage()->some View{
        Image("Lock Password")
            .resizable()
            .frame(width:50,height: 50)
    }
    func ResetText()->some View{
        VStack(spacing:5){
            Text("Change Password")
                .font(.custom(DMSans.bold.rawValue, size: 24))
                .foregroundColor(.newJColor)
            Text("Enter your new password it must be different from previously used password")
                .font(.custom(DMSans.regular.rawValue, size: 13))
                .foregroundColor(.newAColor)
                .multilineTextAlignment(.center)
        }
    }
   
    
    }

   

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView(userId: 0)
    }
}
