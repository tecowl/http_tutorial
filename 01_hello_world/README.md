# Hello, World!

## 使用するツール

- ruby
- curl
- Chrome

## 動かしてみる

### ターミナルA

```
$ cd path/to/http_tutorial/01_hello_world
$ ruby server.rb
```

### ターミナルB

```
$ curl http://127.0.0.1:8080/
Hello, World!
```

`Hello, World!` と表示されることを確認する。


```
$ curl http://127.0.0.1:8080/ -v
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to 127.0.0.1 (127.0.0.1) port 8080 (#0)
> GET / HTTP/1.1
> Host: 127.0.0.1:8080
> User-Agent: curl/7.54.0
> Accept: */*
> 
< HTTP/1.1 200 OK 
< Server: WEBrick/1.4.2 (Ruby/2.5.5/2019-03-15)
< Date: Fri, 26 Jul 2019 03:43:59 GMT
< Content-Length: 13
< Connection: Keep-Alive
< 
* Connection #0 to host 127.0.0.1 left intact
Hello, World!
```

`Hello, World!` 以外に色々表示されることを確認する
この表示されているものは何なのか調べる。

### ターミナルC

より低いレイヤーのコマンドで送信してみる

```
$ echo "GET /" | nc 127.0.0.1 8080
Hello, World!
```


### Chrome

1. `Developer tools` の `Network` を開く
1. Chromeで URLに `http://127.0.0.1:8080/` を指定して開く
1. 指定したURLのリクエストを探して選択しする
1. 内容を確認する


### 考えてみる

1. 表示されたものは何か推測してみる
1. 表示されたものをHTTPの用語を使って説明できるか
1. curlコマンドを実行してから表示されるまでに何が起きているのかをできるだけ細かく説明してみる
