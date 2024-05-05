# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/inject.html
# https://docs.ruby-lang.org/ja/2.1.0/method/Fixnum/i/abs.html
# https://docs.ruby-lang.org/ja/latest/method/Integer/i/next.html

# リストのたたみこみ演算を行う。
# 具体的には初期値と要素をブロックに引き渡し演算を行い、演算後その結果を初期値としておく。その処理を要素の最後まで繰り返し最後はその演算結果を返す
# 合計を計算する。(初期値1,要素[2,3,4,5])
p [2, 3, 4, 5].inject(1) { |result, item| result + item }
# 省略形
p [2, 3, 4, 5].inject(1, :+)
# 配列への格納も可能
p [2, 3, 4, 5].inject([]) { |x, y| x << y**2 }

# Fixnum.abs:絶対値を返す
# Fixnum.abs2:絶対値の2乗を返す
p(-3.abs)
p(-3.abs2)

# Integer.succ:次の整数を返す
p 1.succ
# nextでも表せる
p 1.next

# 論理演算子||(論理和)と&&(論理積)は左辺の式で結果が決まる場合、右辺の評価は行わず、最後に評価した値を返す。
p 1 || nil
# => 1 右辺は評価されない
p nil || 1
# => 1
p 1 && nil
# => nil
p nil && 1
# => nil 右辺は評価されない
p 1 && 2
# => 2 右辺を評価する(左辺を評価しない)

a = [-1, 2, 3, 4, 5]
b = (4..6).to_a
# aとbの和集合[-1, 2, 3, 4, 5, 6]で初期値は配列の先頭を取得し、そこから要素ごとの引き算を演算した絶対値
# |-1 - 2 - 3 - 4 - 5 - 6| = 21
p (a | b).inject(:-).abs
# aとbの積集合[4, 5]で初期値は配列の先頭を取得し、そこから要素ごとの加算を演算した絶対値
# |4 + 5| = 9
p (a & b).inject(:+).abs
# 30
p (a | b).inject(:-).abs + (a & b).inject(:+).abs

# aの次の整数[0, 2, 3, 4, 5, 6]初期値は配列の先頭を取得し、そこから要素ごとの乗算を演算した結果を返す
# 0
p (a || b).map(&:succ).inject(:*)
# b集合[4, 5, 6]で初期値は配列の先頭を取得し、そこから要素ごとの乗算を演算した絶対値の2乗を返す
# 14400(120**2)
p (a && b).inject(:*).abs2
# 29
p (a || b).map(&:succ).inject(:*) * (a && b).inject(:*).abs2 + 29