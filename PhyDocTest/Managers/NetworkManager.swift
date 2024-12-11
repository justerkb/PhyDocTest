//
//  NetworkManager.swift
//  PhyDocTest
//
//  Created by Yerkebulan on 10.12.2024.
//

import UIKit
import Foundation
import SwiftUI
enum APIErrors: Error {
    
    case noWiFi
    case failedToGetData
    case invalidResponse
    case decodingFailed
    case unknown
    case invalidUrl
    case clientSideError(errorMessage: String)
    case serverError(statusCode: Int)
    
}


class NetworkManager {
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    public static let shared = NetworkManager()
    
    private init() {}
    
    let decoder: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    //MARK: - PUBLIC
    public func createAppointment(appoiment: Appoiment, completion: @escaping (Result<String, APIErrors>) -> Void) {
        let endpoint = "https://phydoc-test-2d45590c9688.herokuapp.com/appoint"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        // Создание тела запроса
        let requestBody: [String: Any] = [
            "slot_id": appoiment.slotId,
            "type": appoiment.type
        ]
        
        // Преобразование тела запроса в JSON
        guard let httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: []) else {
            completion(.failure(.unknown))
            return
        }
        
        createRequest(with: url, type: .POST) { request in
            var mutableRequest = request
            mutableRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            mutableRequest.httpBody = httpBody
            
            let task = URLSession.shared.dataTask(with: mutableRequest) { data, response, error in
                if let error = error {
                    completion(.failure(.clientSideError(errorMessage: error.localizedDescription)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.failedToGetData))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode != 200 {
                        completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
                        return
                    }
                } else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                // Декодирование ответа
                if let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                } else {
                    completion(.failure(.decodingFailed))
                }
            }
            task.resume()
        }
    }

    public func getSchedule(completion: @escaping(Result<Schedule, APIErrors>) -> Void, type: String) {
        
    
        
        let endpoint = "https://phydoc-test-2d45590c9688.herokuapp.com/get_schedule?type=\(type)"
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        createRequest(
            with: url,
            type: .GET)
        { request in
            let task = URLSession.shared.dataTask(with: request) { data, responce, error in
                if let error = error {
                    completion(.failure(.clientSideError(errorMessage: error.localizedDescription)))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.failedToGetData))
                    return
                }
                
                if let httpResponce = responce as? HTTPURLResponse {
                    if httpResponce.statusCode != 200 {
                        completion(.failure(.serverError(statusCode: httpResponce.statusCode)))
                        return
                    }
                } else {
                    completion(.failure(.invalidResponse))
                    return
                }

                do {
                    let result = try self.decoder.decode(Schedule.self, from: data)
                    completion(.success(result))
                    
                } catch {
                    completion(.failure(.decodingFailed))
                    return
                }
            }
            task.resume()
        }
        
    }
    
    
    
    //MARK: - PRIVATE
    private func createRequest(with url: URL, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = type.rawValue
        request.timeoutInterval = 30
        
        completion(request)
    }

}
