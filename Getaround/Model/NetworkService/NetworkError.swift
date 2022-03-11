//
//  NetworkError.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

enum NetworkError: Error {
    case dataError
    case responseError
    case decodingData
}

extension NetworkError {
    var description: String {
        switch self {
        case .dataError:
            return "Error retrieving cars"
        case .responseError:
            return "No response from server"
        case .decodingData:
            return "Error decoding car information"
        }
    }
}
