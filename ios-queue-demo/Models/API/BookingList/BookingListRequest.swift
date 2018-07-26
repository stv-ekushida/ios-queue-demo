//
//  BookingListRequest.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/26.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

final class BookingListRequest: WebAPIRequestProtocol {
    
    var path = "path: 2"
    var parameter: [String: String] = [:]
    
    init(bookingId: String) {
        
        parameter = [
            "bookingId" : bookingId
        ]
    }
}
