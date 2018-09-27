//
//  ViewController.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/25.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    //Test
    
    /// 未送信キュー
    let unSentQueue = Queue<WebAPIRequestProtocol>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        demoData()
    }
    
    @IBAction func didTapQueue(_ sender: UIButton) {
        reSend()
    }
}

// MARK: - Private
extension ViewController {

    /// 未送信キューに保存する
    private func demoData() {
        unSentQueue.enqueue(LoginRequest(id: "1", password: "password"))
        unSentQueue.enqueue(BookingListRequest(bookingId: "0001"))
        unSentQueue.enqueue(LoginRequest(id: "2", password: "password"))
    }
    
    /// 再送する
    private func reSend() {
        if unSentQueue.isEmpty {
            return
        }
        
        let node = unSentQueue.dequeue()
        
        switch node.value {
            
        case is LoginRequest:
            guard let request = node.value as? LoginRequest else {
                return
            }
            let api = LoginAPI()
            api.delegate = self
            api.post(request: request)
            
        case is BookingListRequest:
            guard let request = node.value as? BookingListRequest else {
                return
            }
            let api = BookingListAPI()
            api.delegate = self
            api.post(request: request)
            
        default:
            fatalError("それ以外のAPI")
        }
    }
}

// MARK: - APIClientDelegate
extension ViewController: APIClientDelegate {
    
    func success() {
        reSend()
    }
    
    func failure(error: Error) {
    }
}
