# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/method/String/i/split.html

# 基本形
str = '1,2,3,4'
p str.split(',') # => ["1", "2", "3", "4"]

# 引数を指定しない場合、空白文字で分割される
str = '1 2 3 4'
p str.split()

# 複数の区切り文字を指定する場合は、正規表現を使う
str = '1;2:3;4'
# NG(文字リテラルがそのまま返される)
p str.split('/;|:/')
# 正規表現
p str.split(/[;:]/)
# |(パイプ)で表してもOK
p str.split(/;|:/)

# splitメソッドの第二引数には、分割する要素の数を指定できる
str = '1,2,3,4'
p str.split(',', 2) # => ["1", "2,3,4"]
