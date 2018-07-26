//
//  APIClient.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/26.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

protocol APIClientDelegate: class {
    func success()
    func failure(error: Error)
}
