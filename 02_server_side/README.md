# Server side

[前回のHello, World!](../01_hello_world/)では、クライアント側でリクエストとレスポンスを確認したが、
今回はサーバ側でリクエストとレスポンスを確認する。

## 受け取ったリクエストをそのまま表示するサーバ

### ターミナルA

```
$ cd path/to/http_tutorial/02_server_side
$ ruby server1.rb
```

[server1.rb](server1.rb) も確認。


### ターミナルB

```
$ cd path/to/http_tutorial/02_server_side
```

```
curl http://127.0.0.1:8080/
curl http://127.0.0.1:8080/foo/bar/baz
curl "http://127.0.0.1:8080/?page=2&per=10"
curl "http://akm:token@127.0.0.1:8080/private"
curl "http://akm:token@127.0.0.1:8080/products#foo"
curl -H "Authorization: Bearer hogehogetoken" http://127.0.0.1:8080/products
curl -X POST http://127.0.0.1:8080/orders -d '{"name":"HTTP Handbook", "amount":1}'
curl -X POST http://127.0.0.1:8080/comments -d "nickname=akm" -d "comment=HTTP is one of the most commonly used protocol"
curl -X POST http://127.0.0.1:8080/comments -F "nickname=akm" -F "comment=@comment.txt"
```

さまざまなリクエストを送ってみてサーバ側にどう出力されるのか確認する。

[comment.txt](comment.txt) はただのテキストファイルであることを確認。


## サーバ側の解釈

rubyのWEBrickというライブラリによってHTTPリクエストがどのように解釈されるのかを確認する

### ターミナルA

```
$ cd path/to/http_tutorial/02_server_side
$ ruby server2.rb
```

[server2.rb](server2.rb) でサーバ側に用意されている細かなメソッドなどを確認。

### ターミナルB

server1.rb の場合と同じように様々なリクエストを送ってみる。

WEBrickがすべて正しく解釈できるわけではないので、user, userinfo, fragmentはスルーしてOK。


## URLについて調べる

https://developer.mozilla.org/ja/docs/Web/HTTP/Basics_of_HTTP/Identifying_resources_on_the_Web を参照し、サーバ側で表示されてものの意味を調べる。

## ヘッダについて調べる

http://www.tohoho-web.com/ex/http.htm#headers を参照し、サーバ側やクライアント側で表示されているヘッダを調べる

## 次回

前回と今回は通信で使われるリクエストやレスポンスの構造を調べたが、次回はリクエストやレスポンスのBodyによく使われるJSONを触ってみる

[次回 JSONへ](../03_json/) 
