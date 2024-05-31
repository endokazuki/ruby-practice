# frozen_string_literal: true

# Q1からQ23までは既に解答済み

# Q24: laterまで評価を行わない(短絡評価)
# 参考https://qiita.com/gyu-don/items/a0aed0f94b8b35c43290
earlier = true
earlier or later = true
p later
# laterを評価を行わせるならば、以下のようにする
earlier = nil
earlier or later = true
p later

# Q26: 配列の要素を1つずつ返す
# 参考:https://qiita.com/natsume/items/0bfd7c34b8383e25ee8f
ary = [1, 2, 3, 4, 5]
# select(filter)メソッドは、ブロックの戻り値が真になる要素を集めた新しい配列を返す
p(ary.select { |i| i.odd? })
p(ary.filter { |i| i.odd? })
p(ary.filter(&:odd?))
p(ary.select(&:odd?))

# map(collect)メソッドは、ブロックの戻り値を集めた新しい配列を返す(selectと違い、真偽値の判定ではない)
p(ary.collect { |i| i.odd? })
p(ary.map { |i| i.odd? })
p(ary.collect(&:odd?))
p(ary.map(&:odd?))

# Q27: デフォルトは10進数の文字列を整数に変換
puts '42A7'.to_i
# もし、16進数の文字列を整数に変換したい場合は、以下のようにする
puts '42A7'.to_i(16)

# Q29:reject!(delete_if)メソッドを使って80未満の要素を削除
# reject!メソッド以外にも、delete_ifメソッドやselect!メソッドがある(select!メソッドはreject!メソッドの逆)
# rejectメソッドは非破壊的メソッドであり、破壊的メソッドを使いたい場合は、reject!メソッドを使う
# delete_if!メソッドは存在しない(delete_ifが既に破壊的メソッドであるため)
ary = [120, 40, 20, 80, 160, 60, 180]
ary.reject! { |i| i < 80 }
ary.delete_if { |i| i < 80 }
ary.select! { |i| i >= 80 }
p ary

# Q31: %iリテラルでシンボルの配列を作成
# 参考:https://docs.ruby-lang.org/ja/3.1/doc/spec=2fliteral.html#percent
p %i(x1 x2 x3)
# 文字列の場合は、以下のようにする
p %w(x1 x2 x3)
# 大文字リテラルだと、式展開ができる(%Wリテラルも同様)
v = 'yz'
p %I(x1 x2#{v} x3 #{})
# [:x1, :x2yz, :x3, :""]

# Q32: サブクラスにスーパークラスの例外を指定し、rescue節でスーパークラスの例外を捕捉すると、スーパークラスのrescue節が評価される
class ParentError < StandardError; end
class ChildError < ParentError; end

def error_check
  raise ChildError, 'error'
end
begin
  error_check
# ParentErrorはChildErrorの親クラスであるため、ChildErrorのrescue節が先に評価され、次にParentErrorのrescue節が評価される
rescue ParentError
  print 'ParentError'
rescue ChildError
  print 'ChildError'
rescue StandardError
  print 'StandardError'
end
# 上は例外処理として機能するが、rescue節は特定の例外クラスから始まり、最後にStandardErrorクラスを順に指定するのが一般的
begin
  error_check
rescue ChildError
  print 'ChildError'
rescue ParentError
  print 'ParentError'
rescue StandardError
  print 'StandardError'
end

# Q38:initializeメソッドをオーバーライドして、スーパークラスのinitializeメソッドを呼び出す
class Animal
  attr_reader :kind_life

  def initialize
    @kind_life = 'animal_life'
  end
end

class Human < Animal
  def initialize
    @kind_life = 'human_life'
    # superを使うと、スーパークラスのinitializeメソッドを呼び出すことができる
    super
  end
end
human = Human.new
puts human.kind_life

# Q39:String#delete_prefixメソッドは、指定した文字列の接頭辞を削除する
# 参考:https://qiita.com/wangqijiangjun/items/adeae40259ff987adf27
puts '$foo$'.delete_prefix('$')
# 以下はStringクラスのメソッドにはないが、正規表現を使って接頭辞を削除することができる
# subメソッドを使うと、正規表現を使って接頭辞を変更することができる
puts '$foo$'.sub(/\$/, '')
# gsubメソッドを使うと、正規表現を使って該当する全ての文字列を変更することができる
puts '$foo$'.gsub(/\$/, '')
# chopメソッドを使うと、指定した文字列の接尾辞を削除する
puts '$foo$'.chop
# chompメソッドを使うと、指定した文字列の末尾の改行コードを削除する
puts "$foo$\r\n".chomp
# stripメソッドを使うと、指定した文字列の接頭辞と接尾辞の空白や改行コードを削除する
puts " $foo$ \r\n".strip

# Q42:sort_byはマイナス演算子を使うと降順に並び替えることができる(sort.reverseと同じ)
# https://zenn.dev/ganmo3/articles/fdda007796a7cb#sort_by%E3%83%A1%E3%82%BD%E3%83%83%E3%83%89
p([1, 16, 8, 4, 2].sort_by { |x| -x })
p([1, 16, 8, 4, 2].sort.reverse)
# 補足:sort_byは-@を使うことで、降順に並び替えることができる
p([1, 16, 8, 4, 2].sort_by(&:-@))

# Q44:seekメソッドを使ってファイルの先頭から5バイト目直後を指定して読み込む
# 参考:https://qiita.com/nk-ty/items/bd0a5295e540e27936b3
File.write('test', "hellorubyworld\n")
File.open('test') do |file|
  # seekの5はファイルの先頭から5バイト目直後を指定している(5文字目ではない)
  # IO::SEEK_SETはファイルの先頭からのオフセットを指定する
  file.seek(5, IO::SEEK_SET)
  print file.gets
end

# Q46:ファイルを0バイトにし、新規で書き込む場合は、"w"モードを使う(w+モードは読み書き両方可能)
# 下記の場合、test_one.txtの内容がresult.txtにコピーされ、test_two.txtの内容が追記される
# 参考:https://qiita.com/nk-ty/items/bd0a5295e540e27936b3
open('test_one.txt') do |source|
  open('result.txt', 'w') do |dest|
    dest.write(source.read)
  end
end
open('test_two.txt') do |source|
  open('result.txt', 'w+') do |dest|
    dest.write(source.read)
  end
end
# aモードを使うと、ファイルの末尾に追記することができる
open('test_one.txt') do |source|
  open('result.txt', 'a') do |dest|
    dest.write(source.read)
  end
end

# Q50:連続した文字列を生成する場合は、*演算子を使い、*演算子の右辺に整数を指定する
puts 'hello' * 5
# *演算子の左辺に整数を指定し、*演算子の右辺に文字列を指定すると実行時エラーになる
# puts 5 * 'hello'
