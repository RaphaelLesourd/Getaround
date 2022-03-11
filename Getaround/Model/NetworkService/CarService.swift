//
//  CarService.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

import Foundation

class CarService {

    private let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    private func createRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "raw.githubusercontent.com"
        urlComponents.path = "/drivy/jobs/master/mobile/api/cars.json"

        var request = URLRequest(url: urlComponents.url!)
        request.httpMethod = "GET"
        request.allowsExpensiveNetworkAccess = true
        request.timeoutInterval = TimeInterval(30)
        return request
    }
}

extension CarService: ApiService {

    func getAvailableCars(completion: @escaping (Result<[Car], NetworkError>) -> Void) {
        
        let request = createRequest()
        session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.dataError))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.responseError))
                return
            }
            do {
                let carList = try JSONDecoder().decode([Car].self, from: data)
                completion(.success(carList))
            } catch {
                completion(.failure(.decodingData))
            }
        }
        .resume()
    }
}
