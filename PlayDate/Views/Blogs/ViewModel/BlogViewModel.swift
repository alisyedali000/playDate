//
//  BlogViewModel.swift
//  PlayDate
//
//  Created by Aadil on 22/05/2023.
//

import Foundation
class BlogViewModel: ObservableObject {
    @Published var showLoader = false
    @Published var savedBlogsData: [SavedBlogsModel] = []
    @Published var blogsData: [BlogDetails] = []
}


extension BlogViewModel: NetworkManagerService {
    func blogAPI(categoryName: String) async {
        DispatchQueue.main.async{
            self.showLoader = true
        }
        let endPoint : BlogEndPoints = .blog( category_name: categoryName)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[BlogDetails]>.self)
        DispatchQueue.main.async{
            self.showLoader = false
        }
        switch request {
            
        case .success(let data):
            
            debugPrint(data.message ?? "")
            debugPrint(data.status ?? "")
            debugPrint(data.data)
            blogsData = data.data ?? []
           
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
   @MainActor func savedBlogAPI() async{
        self.showLoader = true
        let endPoint: BlogEndPoints = .savedBlog
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[SavedBlogsModel]>.self)
        self.showLoader = false
        switch request {
        case .success(let data):
            debugPrint(data.message ?? "")
            debugPrint(data.status ?? "")
            savedBlogsData = data.data ?? []
            debugPrint(data.data)
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
   
}
