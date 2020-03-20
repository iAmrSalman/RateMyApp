//
//  RemoteAPI.swift
//  RateMyAppKit
//
//  Created by Amr Salman on 3/19/20.
//  Copyright © 2020 Amr Salman. All rights reserved.
//

import Foundation
import PromiseKit
import Moya

public protocol RemoteAPI {
    func request<T: TargetType & MoyaCacheable, R: Codable>(_ target: T) -> Promise<Response<R>>
}

extension RemoteAPI {
    var provider: MoyaProvider<MultiTarget> {
        return MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(), MoyaCacheablePlugin()])
    }
    
    public func request<T: TargetType & MoyaCacheable, R: Codable>(_ target: T) -> Promise<Response<R>> {
        return Promise<Response<R>> { seal in
            provider.request(MultiTarget(target)) { result in
                switch result {
                case .success(let moyaResponse):
                    do {
                        let filteredResponse = try moyaResponse.filterSuccessfulStatusCodes()
                        let decoder = JSONDecoder()
                        let response = try filteredResponse.map(Response<R>.self, using: decoder)
                        seal.fulfill(response)
                    } catch {
                        seal.reject(error)
                        print(error)
                    }
                case .failure(let error):
                    seal.reject(error)
                    print(error)
                }
            }
        }
    }
    
    public func validate<R: Codable>(_ response: Response<R>) -> Promise<Response<R>> {
        return Promise<Response<R>> { seal in
            if let errorMessage = response.errorMessage {
                seal.reject(ErrorMessage(title: "Remote API", message: errorMessage))
            } else {
                seal.fulfill(response)
            }
        }
    }

}
