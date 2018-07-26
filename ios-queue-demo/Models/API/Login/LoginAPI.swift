//
//  LoginAPI.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/26.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

final class LoginAPI {
    
    weak var delegate: APIClientDelegate?
    
    func post(request: LoginRequest) {
        
        print("Login API Request : ", request.parameter.prettyPrintedJsonString)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.delegate?.success()
        }
    }
}
