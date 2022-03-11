//
//  ApiService.swift
//  Getaround
//
//  Created by Birkyboy on 10/03/2022.
//

protocol ApiService {
    func getAvailableCars(completion: @escaping (Result<[Car], NetworkError>) -> Void)
}
