//
//  ReadBlogModel.swift
//  PlayDate
//
//  Created by Aadil on 23/05/2023.
//

import Foundation
class ReadBlogModel: ObservableObject {
    @Published var showLoader = false
    @Published var blogsData: [BlogDetails] = []
}


extension ReadBlogModel: NetworkManagerService {
    func readBlogAPI(categoryName: String) async {
        self.showLoader = true
        let endPoint : BlogEndPoints = .blog( category_name: categoryName)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[BlogDetails]>.self)
        self.showLoader = false
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
    func saveblogAPI(blogID: String) async {
        let endPoint: BlogEndPoints = .saveblog(blog_id: blogID)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[BlogDetails]>.self)
        debugPrint(endPoint)
        switch request {
        case .success(let data):
            
            debugPrint(data.message ?? "")
            debugPrint(data.status ?? "")
            debugPrint(data.data)
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
    
}
