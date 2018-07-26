//
//  WebAPIRequestProtocol.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/26.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

protocol WebAPIRequestProtocol: class {}

extension WebAPIRequestProtocol {
    
    var baseURLString: String {
        return ""
    }
    
    var endPoint: String {
        return ""
    }
    
//    var httpMethod: HTTPMethod {
//        return .post
//    }
    
    var path: String {
        return ""
    }
    
    var parameter: [String: String] {
        return [:]
    }
    
    var header: [String: String] {
        return [:]
    }
    
    var body: [String: String] {
        return [:]
    }
}
