# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Object/i/equal=3f.html
# https://docs.ruby-lang.org/ja/latest/method/Object/i/eql=3f.html
# https://docs.ruby-lang.org/ja/2.1.0/class/Fixnum.html
# https://docs.ruby-lang.org/ja/2.1.0/class/Float.html

# eql?は同値性、equal?は同一性を検証する
# 同一性を例えると、同姓同名は名前は同じ(同値)だが、同じ人物ではない
name1 = 'suzuki'
name2 = 'suzuki'

name1.eql?(name2)   # => true
name1.equal?(name2) # => false

# 但し、実体がないものなどは同一性があるとみなす場合がある
p true.equal?(true)   # => true
p false.equal?(false) # => true
p nil.equal?(nil)     # => true
p :a.equal?(:a)       # => true
p 1.equal?(1)         # => true
p 3.14.equal? 3.14    # => true

arr = [
  true.equal?(true),
  nil.eql?(NilClass),
  String.new.equal?(String.new),
  1.equal?(1)
]
p arr
# [true, false, false, true]
# 真と真は同一である
# オブジェクトとクラスは同値ではない
# オブジェクト同士は同一ではない(シンボルで扱った場合は別)
# 同じ数字のオブジェクトは同一である(これを否定すると1つの数字に複数の解釈が入ってしまう)
p arr.collect { |a| a ? 1 : 2 }.inject(:+)
# 6

# Fixnum:整数のクラス
x = 1
# Float:浮動小数点数のクラス
y = 1.0

print x == y # 数値として等しいのでtrue
print x.eql? y # FixnumとFloatクラスのオブジェクトなのでfalse
