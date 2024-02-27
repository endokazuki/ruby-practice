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

count = 0

begin
  1 / count
rescue NameError
  count += 1
  retry
rescue NoMethodError
  count += 2
  retry
rescue ZeroDivisionError
  count += 3
  retry
else
  puts 4
# 例外処理で必ず実行される処理
ensure
  puts "count: #{count}"
end
