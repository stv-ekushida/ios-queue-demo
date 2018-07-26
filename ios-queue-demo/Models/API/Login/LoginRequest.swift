//
//  LoginRequest.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/26.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

final class LoginRequest: WebAPIRequestProtocol {
    
    var path = "path: 1"
    var parameter: [String: String] = [:]
        
    init(id: String, password: String) {
        
        parameter = [
            "username" : id,
            "password" : password
        ]
    }
}
