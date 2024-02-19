# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/class/RuntimeError.html

# raiseメソッドは、引数を指定しない場合RuntimeErrorが発生する
# RuntimeError は StandardError のサブクラスで、具体的には StandardError は RuntimeError とその他の例外クラスの親クラスを意味する
# 参考:https://lhiroki1205.hatenablog.com/entry/2019/02/26/144914
begin
  raise '特定の例外が発生しました'
rescue StandardError => e
  puts e.class   # => RuntimeError
  puts e.message # => 特定の例外が発生しました
end
