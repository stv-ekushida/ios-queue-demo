//
//  Queue.swift
//  ios-queue-demo
//
//  Created by Eiji Kushida on 2018/07/25.
//  Copyright © 2018年 Eiji Kushida. All rights reserved.
//

import Foundation

final class Queue<T> {
    
    class QueueNode<T> {
        
        var value: T
        var next: QueueNode?
        weak var previous: QueueNode?
        
        init(value: T) {
            self.value = value
        }
    }
    
    typealias Node = QueueNode<T>
    
    /// キューの先頭
    private var head: Node?
    
    /// キューの末尾
    private var tail: Node? {
        
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    /// キューが空かどうか？
    var isEmpty: Bool {
        return head == nil
    }
    
    /// キューに蓄積されている件数
    var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    /// キューに末尾に追加する
    ///
    /// - Parameter value:　データ
    func enqueue(_ value: T) {
        enqueue(Node(value: value))
    }
    
    /// キューに末尾に追加する
    ///
    /// - Parameter node: ノード
    func enqueue(_ node: Node) {
        
        let newNode = node

        // キューの先頭以外
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    subscript(index: Int) -> T {
        let node = self.node(at: index)
        return node.value
    }
    
    /// キューの指定行からデータを取り出す
    ///
    /// - Parameter index: インデックス
    /// - Returns: データ
    func node(at index: Int) -> Node {
        
        guard let head = head else {
            fatalError("List is empty")
        }
        
        guard index >= 0 else {
            fatalError("index must be greater than 0")
        }
        
        if index == 0 {
            return head
        } else {
            var node = head.next
            
            for _ in 1..<index {
                node = node?.next
                
                if node == nil {
                    break
                }
            }
            
            guard let result = node else {
                fatalError("index is out of bounds.")
            }
            return result
        }
    }
    
    /// キューの先頭からデータを取り出す
    ///
    /// - Returns: データ
    func dequeue() -> Node {
        let node = self.node(at: 0)
        return remove(node: node)
    }
    
    /// キューからすべて削除する
    func removeAll() {
        head = nil
    }
    
    /// キューの該当データを削除する
    ///
    /// - Parameter node: 削除するデータ
    /// - Returns: データ
    @discardableResult func remove(node: Node) -> Node {
        
        let previous = node.previous
        let next = node.next
        
        if let previous = previous {
            previous.next = next
        } else {
            head = next
        }
        next?.previous = previous
        
        node.previous = nil
        node.next = nil
        return node
    }
}
