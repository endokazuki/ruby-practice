# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/method/Array/i/flatten.html

# 文字列配列の書き方は以下の通り
p ['apple', 'banana', 'orange']
p %w[apple banana orange]
p %(apple banana orange)
p %|apple banana orange|

# Array#flattenメソッドは、レシーバの配列をフラット化する。（n次元の配列を1次元に落とし込む）
p [['apple'], ['banana'], ['orange']].flatten

# Array#reverseメソッドは、レシーバの配列を逆順にした新しい配列を返します。
p %w[apple banana orange].reverse