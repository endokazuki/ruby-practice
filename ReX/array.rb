# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Array/i/flatten.html
# https://docs.ruby-lang.org/ja/latest/method/Array/s/new.html
# https://docs.ruby-lang.org/ja/latest/method/Array/i/product.html
# https://docs.ruby-lang.org/ja/latest/method/Array/i/transpose.html
# https://docs.ruby-lang.org/ja/latest/method/Array/i/to_h.html
# https://docs.ruby-lang.org/ja/latest/method/Array/i/slice.html

# 文字列配列の書き方は以下の通り
p ['apple', 'banana', 'orange']
p %w[apple banana orange]
p %(apple banana orange)
p %|apple banana orange|

# Array#flattenメソッドは、レシーバの配列をフラット化する。（n次元の配列を1次元に落とし込む）
p [['apple'], ['banana'], ['orange']].flatten

# Array#reverseメソッドは、レシーバの配列を逆順にした新しい配列を返します。
p %w[apple banana orange].reverse

# Array.product:レシーバの配列と引数で与えられた配列（複数可）のそれぞれから要素を1個ずつとって配列とし、それらのすべての配列を要素とする配列を返す
# 返される配列の長さは，レシーバと引数で与えられた配列の長さのすべての積
p [1, 2].product([3, 4], [5, 6, 7])
# => [[1, 3, 5], [1, 3, 6], [1, 3, 7], [1, 4, 5], [1, 4, 6], [1, 4, 7],
#     [2, 3, 5], [2, 3, 6], [2, 3, 7], [2, 4, 5], [2, 4, 6], [2, 4, 7]]
# レシーバの配列*各引数内の配列数

# Array.transpose:行列の転置(行と列の入れ換え)を行う
p [1, 2].product([3, 4], [5, 6, 7]).transpose
# 12行3列 => 3行12列

# 配列を1つずつ返す
a = [1, 2, 3, 4, 5]
a.each { |n| puts n }
a.each_with_index { |n, _i| puts n }

# hashにする
p [[:foo, :bar], [1, 2]].to_h

# Array.slice:指定された自身の要素を返す
# 第一引数:指定する要素, 第二引数:指定された要素から返す部分配列
p [1, 2, 3, 4, 5].slice(2)
# 3
p [1, 2, 3, 4, 5].slice(2, 2)
# [3, 4]

# 同一オブジェクトの配列
# ary = Array.new(3, "foo")
# p ary
# ary[0].capitalize!
# p ary

# # 異なるオブジェクトの配列
# ary2 = Array.new(3){ "foo" }
# p ary2
# ary2[0].capitalize!
# p ary2
