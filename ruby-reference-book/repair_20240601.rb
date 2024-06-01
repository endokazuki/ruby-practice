# frozen_string_literal: true

# 自惚れミスを中心に、修正を行う
# Q17: splitで正規表現を使う場合は//で囲む
word = 'Ruby;is;an;object:oriented:programming:language'
p word.split(/[:;]/)
# => ["Ruby", "is", "an", "object", "oriented", "programming", "language"]

# Q18:新しい配列が生成されると、object_idが変わる
a = [1, 2, 3]
b = [1, 3, 5]
# cのobject_idはaと同じ(正確には、aのobject_idを参照している)
c = a
p a.object_id
p c.object_id
# cのobject_idはaと異なる(aは新たな配列オブジェクトを生成している)
a = b & c
p a.object_id
p c.object_id
p a + b + c
# => [1, 3, 5, 1, 3, 5, 1, 2, 3]

# Q21: Array#+は、配列を連結する。重複する要素は削除されない
# Array#-は、配列の要素を削除する。
# 参考：https://docs.ruby-lang.org/ja/latest/class/Array.html#I_--2D
a = [1, 2, 3]
b = [1, 3, 5]
c = [1, 3, 4]
# aとbの配列を連結し、重複する要素を削除しない
# その配列からcの配列に該当する要素を全て削除する
p a + b - c
# => [2, 5]
# => [1, 2, 5]ではない

# Q24:shift,unshift,pushは破壊的メソッド
# unshiftに引数を指定しない場合、何も追加されない
ary = [1, 2, 3]
ary.shift
ary.shift
ary.unshift
ary.push(4)
p ary

# Q25:compactやuniqは破壊的メソッドではない
ary = [1, 2, 3, nil, 1, 2, 3]
# compactはnilを削除する
ary.compact
# uniqは重複する要素を削除する
ary.uniq
p ary
# 破壊的メソッドを使う場合は!を付ける
ary.compact!
ary.uniq!
p ary

# Q26:findメソッドとdetectメソッドは同じ
ary = [1, 2, 3]
p(ary.find { |n| n == 2 })
p(ary.detect { |n| n == 2 })
# selectメソッドはfilterメソッドと同じ
p(ary.select { |n| n.odd? })
p(ary.filter { |n| n.odd? })

# Q29:transposeメソッドは、行列の行と列を入れ替える
ary1 = [1, 2, 3]
ary2 = [4, 5, 6]
p [ary1, ary2].transpose
# => [[1, 4], [2, 5], [3, 6]]

# Q32:rubyのencodingのデフォルトはUTF-8
# 参考:https://docs.ruby-lang.org/ja/latest/class/Encoding.html
# デフォルトのencodingを確認する場合は、__ENCODING__を使う
p __ENCODING__
p 'こんにちは'.encoding.name
# encodingを指定する場合は、encodeメソッドを使う
p 'こんにちは'.encode('EUC-JP').encoding.name

# Q33:indexメソッドは、指定した要素が最初に登場する位置を返す
ary = [1, 2, 3, 4, 5]
p ary.index(3)
# => 2
# 文字列の場合は、指定した文字列が最初に登場する位置を返す
str = 'RubyRubyRubyRuby'
p str.index('Ruby')
# => 0
# 第二引数を指定すると、検索を開始する位置を指定できる
p str.index('R', 5)
# => 8(5文字目以降で最初に登場する位置)

# Q36:正規表現のsliceメソッドは、指定した正規表現にマッチする部分を返す
str = 'Ruby is an object oriented programming language'
# \bは単語の境界を表す
# \wは単語構成文字を表す
p str.slice(/\bo\w+/)
# => "object"
# 破壊的メソッドではない
p str
# 該当する文字全てを取り出す場合は、sliceメソッドの代わりにscanメソッドを使う
p str.scan(/\bo\w+/)
# => ["object", "oriented"]
# 配列のsliceメソッドは、指定した要素を取り出す。第二引数を指定すると、取り出す要素の数を指定できる
ary = [1, 2, 3, 4, 5]
p ary.slice(1, 2)

# Q37:deleteメソッドは、指定した要素を削除する
# Array#deleteは破壊的メソッド
ary = [1, 2, 3, 4, 5]
ary.delete(3)
p ary
# 文字列の場合は、指定した文字列を削除する
# String#deleteは非破壊的メソッド
str = 'RUBY is an object oriented programming language'
# ^は否定を表す
p str.delete('^A-Z')
p str

# Q40:chrメソッドは、数値をASCIIコードを使用して文字に変換する
# ordメソッドは、文字を数値に変換する
# 参考:https://docs.ruby-lang.org/ja/latest/method/Integer/i/chr.html
# 参考:https://docs.ruby-lang.org/ja/latest/method/String/i/ord.html
p 65.chr
# => "A"
p 65.chr.encoding.name
# => "US-ASCII"
p 'A'.ord
# => 65

# Q42:hashの作成
hash1 = { 'apple' => 100, 'banana' => 500 }
# 別の書き方
hash2 = { apple: 100, banana: 500 }
# 別の書き方
hash3 = { :apple => 100, :banana => 500 }
# 別の書き方
hash4 = { 'apple': 100, 'banana': 500 }
# hash2, hash3, hash4は同じで、シンボルをキーにしたハッシュを作成している
p hash1, hash2, hash3, hash4
