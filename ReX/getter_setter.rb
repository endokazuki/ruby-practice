# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://qiita.com/katsutakashima/items/fff67799614c40ba5520

# frozen_string_literal: true
class Foo
  @@var = 0

  # ゲッターメソッド
  def var
    @@var
  end

  # セッターメソッド
  def var=(num)
    @@var = num
  end
end

class Bar < Foo
end

foo = Foo.new
# Fooクラスのセッターメソッドから@@varのクラス変数を更新
foo.var += 1
bar = Bar.new
# Barクラスのセッターメソッドから@@varのクラス変数を更新
bar.var += 2

puts "#{foo.var}/#{bar.var}"
