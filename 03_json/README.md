# JSON

[前回のServer side](../02_server_side/) と [前々回の Hello, World!](../01_hello_world/) ではHTTPのリクエストとレスポンスの構造を調べたが、今回はそのBodyによく使われるJSONについて学ぶ。

## JSONの概要

JSON の定義 https://www.json.org/json-ja.html

JSONは、データの表現する文字列のフォーマットと言うことができる。
あくまで文字列のフォーマットを決めるだけのものなので、`JavaScript Object Notation`
という名前だが、JavaScriptでしか使えないものではなく、単なるデータの表現形式なので、
XMLやYAMLと同じように扱うことができる。

日本語の解説は https://dev.classmethod.jp/etc/concrete-example-of-json/ がわかり易い。

非常にシンプル。値の種類は、以下の７つのみ

- object
- array
- string
- number
- "true"
- "false"
- "null"

非常にシンプルだが、組み合わせて使うことで、複雑なデータでも表現できる。

### サンプル

- http://opensource.adobe.com/Spry/samples/data_region/JSONDataSetSample.html
- https://www.json-generator.com/ で `Generate` を押して出てくるデータ

## JavaScriptでJSONを触ってみる

Chromeの `Developer tools` の `Console` を開いて以下を実行してみる

### まずはJavascript Ojectを触る

Javascript Oject は JSONではなく、JavaScript上のObjectや配列などのデータである。

```
people = [
  {
    "id": "5d3ad5a3c32a741f1c5bcee3",
    "name": "Downs Merritt",
    "company": {
      "id": "5d3ad5a34ae6708a22fff4c7",
      "name": "MACRONAUT"
    },
    "email": "downsmerritt@macronaut.com",
    "created_at": "2018-08-05T05:11:54 -09:00"
  },
  {
    "id": "5d3ad5a33e01044cc1cd74a7",
    "name": "Elsie Goodman",
    "company": {
      "id": "5d3ad5a3c52f6da34cad6166",
      "name": "BITENDREX"
    },
    "email": "elsiegoodman@bitendrex.com",
    "created_at": "2019-07-21T12:36:09 -09:00"
  },
  {
    "id": "5d3ad5a394607dad5df2d005",
    "name": "Harriet Prince",
    "company": {
      "id": "5d3ad5a382c6bcf3103e3973",
      "name": "ISOTERNIA"
    },
    "email": "harrietprince@isoternia.com",
    "created_at": "2018-06-01T10:39:40 -09:00"
  }
]
```

定義したオブジェクトの中身にアクセスするには以下のように記述する。

```
people[0]["id"]
people[0]["compary"]
people[0]["compary"]["name"]
```

変更もできる

```
people[1]["company"]["name"] = "Bytend-REX"
```

変更後 `people` を確認。

```
people
```


### Javascript ObjectとJSONを変換

```
people_str = JSON.stringify(people)
```

これで `people` が JSON形式の文字列に変換され、 `people_str` に代入される。
`people_str` の文字列を確認するためには、コンソールにログ出力してみるとわかり易い。

```
console.log(people_str)
```

逆にJSON形式の文字列からJavasreipt Objectを生成するには `JSON.parse` を用いる

```
people2 = JSON.parse(people_str)
```

ここでは `Developer Console` で、 JavaScriptを用いてJSONとJavascript Objectの変換を用いたが、
ほとんどの言語でもJSONとの変換が可能である。

## RubyでのJSONの操作

ディレクトリを移動して `irb` (RubyのREPL) を起動する

```
cd path/to/http_tutorial/03_json
irb
```

[people.json](people.json)というJSONファイルからの読み込み

```
content = File.read('people.json'); nil
require 'json'
people = JSON.parse(content); nil
people[-1]["name"]
```

データを操作して、JSON形式に変換

```
people[-1]["name"] = "Neil Alden Armstrong"
puts JSON.pretty_generate(people[-1])
```


## 実際のJSONデータをjqで整形する

[people.json](./people.json) の内容は、インデントしてあって読みやすくなっているが、実際のアプリケーションでは空白は除いて使用するため非常に読みにくくなる。
rubyでインデントを除いたJSONを作ってみる。

```
ruby -r json -e 'puts JSON.dump(JSON.parse(File.read("./people.json")))' > people-without-indent.json
```

作成された `people-without-indent.json` を見てみると非常に読みにくい。

このようなJSONを整形する場合に使うのが [jq](https://stedolan.github.io/jq/) だ。

例えばパイプでつなぐとインデントして読みやすくしてくれる

```
cat people-without-indent.json | jq .
```

jqにはフィルタを指定することで、その出力を変更することができる（上の`jq` への引数 `.` もフィルタである)。

例えばnameだけを抽出する場合は以下のように指定する

```
cat people-without-indent.json | jq ".[].name"
```

idとnameだけのデータに整形
```
cat people-without-indent.json | jq ".[] | {id: ._id, name: .name}"
```

jqの詳しい使い方は https://dev.classmethod.jp/tool/jq-manual-japanese-translation-roughly/ がわかり易い。


## 次回

次回は、これまでに学んだHTTPの基本とJSONを使ったRESTful APIを使ってみる
