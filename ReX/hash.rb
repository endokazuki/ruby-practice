# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Hash/i/each.html
# https://docs.ruby-lang.org/ja/latest/method/Hash/i/invert.html

{ a: 1, b: 2 }.each { |a| p a }
# 引数が1つだとハッシュごとの配列を返す
#=> [:a, 1]
#   [:b, 2]

{ a: 1, b: 2 }.each { |k, v| p "key #{k}, value #{v}" }
# 引数が2つだとハッシュごとのkey、valueを返す
# =>"key a, value 1"
# "key b, value 2"

{ a: 1, b: 2 }.each { |k, v| p "key #{k.class}, value #{v.class}" }
# => "key Symbol, value Integer"
#   "key Symbol, value Integer"

# Hash.invert:キーと値を入れ替える
# 入れ替えの結果キーが重複した場合は、後に定義された方が優先される
h = { a: 100, b: 100, c: 200 }
p h.invert
# =>{100=>:c, 200=>:b}
