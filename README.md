# ios-queue-demo
Queueクラス

## 主なプロパティ
| プロパティ名 | 説明 |
|---|---|
| count | キューに保存されている件数 |


## 主なメソッド
| メソッド名 | 説明 |
|---|---|
| enqueue(value: T) | キューに保存する |
| dequeue() | キューから取り出す |

### 使い方

```
    /// 未送信キュー
    let unSentQueue = Queue<WebAPIRequestProtocol>()

    /// 未送信キューに保存する
    unSentQueue.enqueue(LoginRequest(id: "1", password: "password"))
    unSentQueue.enqueue(BookingListRequest(bookingId: "0001"))
    unSentQueue.enqueue(LoginRequest(id: "2", password: "password"))

    /// 未送信キューから取り出す
    let node = unSentQueue.dequeue()
```

