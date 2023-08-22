//
//  EditPetDetails.swift
//  PlayDate
//
//  Created by عادل🫥 on 19/04/2023.
//

import SwiftUI
import UIKit
struct AddPetDetails: View {
    @StateObject var addVM = AddPetViewModel()
    @Environment (\.dismiss) var dismiss
    @State var pickedImage = UIImage(named: AppImages.pet.rawValue)
    @State var openPhotos = false
    @State var showCalender = false
   
 
    
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $addVM.showLoader)
            if showCalender {
             
                DatePickerMLB(showDatePicker: $showCalender) { date in
                    addVM.age = DateManager.shared.getString(from: date)
                    print("date is: \(addVM.age)")
                }
            }
        }
        
            .alert("PlayDate Error", isPresented: $addVM.showError) {
                
            } message: {
                Text(addVM.errorMessage)
            }
            .sheet(isPresented: $openPhotos) {
                ImagePicker(allowsEditing: false, sourceType: .photoLibrary) { image in
                    
                    pickedImage = image
                    addVM.base64Image = image.resizedTo1MB()?.base64 ?? ""
                }
            }
    }
    
}

extension AddPetDetails{
    func loadView()->some View{
        VStack(spacing:10){
            
            ZStack {
                CustomNavButton(title: "Add a Pet")
                
            }
            Spacer()
            Button {
                self.openPhotos.toggle()
            } label: {
                
                Image(uiImage: pickedImage ?? UIImage())
                   .resizable()
                  .frame(width: 80, height:  80)
                  .clipShape(Circle())
            }

            petTextFields()
            petattributes()
            VStack {
                getvaccinated()
                AppButton(title: "Add Profile"){
                    
                   
                    
                    
                    if addVM.isValidateAddDetails(){
                            Task{
                                await addVM.AddPetAPI(completion: {
                                    DispatchQueue.main.async {
                                        self.dismiss()
                                        
                                    }
                                   
                                })
                            }
                        }
                    }
                
            }
            Spacer()
            
        }.padding(20)
    }
    func petTextFields()->some View{
        VStack(){
            VStack(alignment:.leading,spacing: 10){
                Text("Name")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                CustomTextfield(placeholder: "Name", image: "", text: $addVM.nametext)
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Interests")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))

                TextField("Catching ball", text: $addVM.interest, onCommit: {
                    addVM.totalInterests.append(addVM.interest)
                    addVM.interest = ""
                })
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                    .padding(20)
                    .background(Color.newTFColor)
                    .cornerRadius(15)
                    .keyboardType(.default)
                
                
                TagView(tags: $addVM.totalInterests, showCross: true) { tag in
                    let index = addVM.totalInterests.firstIndex(of: tag)
                    addVM.totalInterests.remove(at: index!)
                }
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Age")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                ActionLabelDatePicker(title: addVM.age) {
                    self.showCalender.toggle()
                }
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Color")
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                ColorMenu(colorSelection: $addVM.colorSelection)
            }
        }
    }
    func petattributes()->some View{
        HStack(){
            VStack(alignment:.leading,spacing: 10){
                Text("Gender")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                DropDownMenu(genderSelection: $addVM.gender)
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Breed")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                BreedDropDown(breedSelection: $addVM.breedSelection)
                
            }
        }
    }
}
extension AddPetDetails{
    func getvaccinated()->some View{
        HStack{
            Image(AppImages.VaccinateIcon.rawValue)
                .resizable()
                .frame(width: 40, height: 40)
            Text("Vaccinated")
                .foregroundColor(.black)
                .font(.custom(DMSans.regular.rawValue, size: 13))
            
            Toggle("", isOn: $addVM.isVaccinated)
                .toggleStyle(SwitchToggleStyle(tint: .newBTColor))
        }
    }
    
    func addIntertest(interest: String) {
        addVM.interest = ""
        addVM.totalInterests.append(addVM.interest)

    }
}

struct AddPetDetails_Previews: PreviewProvider {
    static var previews: some View {
        AddPetDetails()
        AddPetDetails()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
