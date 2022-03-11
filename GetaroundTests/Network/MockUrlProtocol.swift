//
//  MockUrlProtocol.swift
//  GetaroundTests
//
//  Created by Birkyboy on 10/03/2022.
//

import XCTest

struct HandlerResponse {
    let response: HTTPURLResponse
    let data: Data?
    let error: Error?
}

final class MockURLProtocol: URLProtocol {
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    static var loadingHandler: ((URLRequest) -> HandlerResponse)?

    override func startLoading() {
        guard let handler = MockURLProtocol.loadingHandler else {
            XCTFail("Loading handler is not set.")
            return
        }
        let requestHandler = handler(request)
        let responseHandler = HandlerResponse(response: requestHandler.response,
                                                      data: requestHandler.data,
                                                      error: requestHandler.error)
        if let data = responseHandler.data {
            client?.urlProtocol(self, didReceive: responseHandler.response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } else {
            client?.urlProtocol(self, didFailWithError: responseHandler.error!)
        }
    }

    override func stopLoading() {}
}
