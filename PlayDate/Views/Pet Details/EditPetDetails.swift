//
//  EditPetDetails.swift
//  PlayDate
//
//  Created by عادل🫥 on 19/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct EditPetDetails: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var editVM = EditPetViewModel()
    @State var showresult = true
    @State var pickedImage = UIImage(named: AppImages.pet.rawValue)
    @State var openPhotos = false
    @State var showCalender = false
    var editDetails: AddPetModel
    init(editDetails: AddPetModel){
        self.editDetails = editDetails
    }
   

    
    var body: some View {
        ZStack {
            loadView()
           
               
            
            if showCalender {
             
                DatePickerMLB(showDatePicker: $showCalender) { date in
                    editVM.age = DateManager.shared.getString(from: date)
                    print("date is: \(editVM.age)")
                }
            }
        } .onAppear{
    
            debugPrint(editDetails)
            editVM.nametext = editDetails.name ?? ""
            editVM.totalInterests = editDetails.interests ?? []
            editVM.age = editDetails.age ?? ""
            editVM.color = editDetails.colour ?? ""
            editVM.gender = editDetails.gender ?? ""
            editVM.breed = editDetails.breed ?? ""
            editVM.isVaccinated = editDetails.vaccinated == "1" ? true : false
        }
       
        
            .alert("PlayDate Error", isPresented: $editVM.showError) {
                
            } message: {
                Text(editVM.errorMessage)
            }
            .sheet(isPresented: $openPhotos) {
                ImagePicker(allowsEditing: false, sourceType: .photoLibrary) { image in
                    
                    pickedImage = image
                    editVM.base64Image = image.resizedTo1MB()?.base64 ?? ""
                    Task {
                        await editVM.imageAPI(petID: String(editDetails.id ?? 0))
                    }
                    
                }
                
            }
    }
    
}
extension EditPetDetails{
     func loadView()->some View{
        VStack(spacing:10){
         
            ZStack (){
                CustomNavButton(title: "Edit a Pet")
                
            }
        Spacer()
            
            Button {
                
                self.openPhotos.toggle()
            }
        label: {
            let url =  AppUrl.IMAGEURL + (editDetails.image ?? "")
            WebImage(url: URL(string: url))
                   .resizable()
                   .indicator(.activity)
                  .frame(width: 80, height:  80)
                  .clipShape(Circle())
            }
           
          

            
            petTextFields()
            petattributes()
            VStack {
                getvaccinated()
                AppButton(title: "Update Profile"){
                    
                    if editVM.isVlidateEdit(){
                      
                            Task{
                                await editVM.updatePetAPI(petID: String( editDetails.id ?? 0))
                            }
                    
                            DispatchQueue.main.async {
                                self.dismiss()
                                
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
                CustomTextfield(placeholder: "Name", image: "", text: $editVM.nametext)
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Interests")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))

                TextField("Catching ball", text: $editVM.interest, onCommit: {
                    editVM.totalInterests.append(editVM.interest)
                    editVM.interest = ""
                })
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                    .padding(20)
                    .background(Color.newTFColor)
                    .cornerRadius(15)
                    .keyboardType(.default)
                
                
                TagView(tags: $editVM.totalInterests, showCross: true) { tag in
                    let index = editVM.totalInterests.firstIndex(of: tag)
                    editVM.totalInterests.remove(at: index!)
                }
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Age")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                ActionLabelDatePicker(title: editVM.age){
                    self.showCalender.toggle()
                }
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Color")
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                ColorMenu(colorSelection: $editVM.color)
                   
            }
        }
    }
    func petattributes()->some View{
        HStack(){
            VStack(alignment:.leading,spacing: 10){
                Text("Gender")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                DropDownMenu(genderSelection: $editVM.gender)
                
                
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Breed")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                BreedDropDown(breedSelection: $editVM.breed)
                
                
            }
        }
    }
}

extension EditPetDetails{
    func getvaccinated()->some View{
        HStack{
            Image(AppImages.VaccinateIcon.rawValue)
                .resizable()
                .frame(width: 40, height: 40)
            Text("Vaccinated")
                .foregroundColor(.black)
                .font(.custom(DMSans.regular.rawValue, size: 13))
            
            Toggle("", isOn: $editVM.isVaccinated)
                .toggleStyle(SwitchToggleStyle(tint: .newBTColor))
        }
    }
 
    func cateogeryRectangle(cateogery:String)->some View{
        
        ZStack {
            RoundedRectangle(cornerRadius:54)
                .foregroundColor(.newprofilebackground)
                .frame(height: 116)
            HStack{
                Text(cateogery)
                    .foregroundColor(.newBTColor)
                    .font(.custom(DMSans.regular.rawValue, size: 12))
               
                    Image(AppImages.Closecircle.rawValue)
                        .resizable()
                        .frame(width: 15, height: 15)
                
            }
        }.padding()
        
    }
}

struct EditPetDetails_Previews: PreviewProvider {
    static var previews: some View {
        EditPetDetails(editDetails: AddPetModel())
        EditPetDetails(editDetails: AddPetModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
