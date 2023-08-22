//
//  ApiManager.swift
//  Unified
//
//  Created by Taimoor Arif on 23/08/2022.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: Any?]? { get }
    var queryItems: [URLQueryItem]? { get }
}

extension Endpoint {
    var scheme: String {
        return AppUrl.SCHEME
    }
    
    var host: String {
        return AppUrl.BASEURL
    }
    
    var header: [String: String]? {
        return ["Content-Type": "application/json"]
    }
    var queryItems:[URLQueryItem]? {
        nil
    }
    
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized(reason:String?)
    case sessionExpried
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized (let reason):
            return reason ?? "Session expired"
        default:
            return "Unknown error"
        }
    }
}

protocol NetworkManagerService {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
}
extension NetworkManagerService {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.queryItems
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        debugPrint("⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️ ⚠️")
        debugPrint(url)
        
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = jsonData
                debugPrint("params \(String(decoding: jsonData, as: UTF8.self))")
            } catch {
                return .failure(.unknown)
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            
            debugPrint(String(data: data, encoding: String.Encoding.utf8) ?? "")
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return .success(decodedResponse)
                    
                } catch let error {
                    debugPrint(error)
                    debugPrint("❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌")
                    return .failure(.decode)
                }
                
            case 401:
                let error = try parseJSON(from: data)
                debugPrint("❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌")
                debugPrint(error)
                return .failure(.unauthorized(reason: error.message))
                
            default:
                debugPrint("❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌")
                return .failure(.unexpectedStatusCode)
            }
        } catch let error {
            debugPrint("❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌")
            return .failure(.unauthorized(reason: error.localizedDescription))
        }
    }
    
    private func parseJSON(from data: Data) throws -> GenericResponse {
        do {
            let decode = try JSONDecoder().decode(GenericResponse.self, from: data)
            debugPrint(decode)
            return decode
            /// force logout here if needed
        } catch let error {
            debugPrint(error)
            debugPrint("❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌ ❌")
        }
        return GenericResponse()
    }
}
