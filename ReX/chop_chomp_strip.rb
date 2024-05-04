# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/method/String/i/chop.html

# chopメソッドは文字列の末尾の改行文字を取り除いた新しい文字列を返します。
# chopメソッドは文字列の終端が "\r\n" であればその 2 文字を取り除く。
# \n, \r\n, \r, \nのいずれかの改行文字が文字列の末尾にある場合、その改行文字を取り除いた文字列を返します。改行文字がない場合は、文字列をそのまま返します。
# \nはLF文字(Line Feed)、\rはCR文字(Carriage Return)と呼ばれる制御文字
p "string\n".chop    # => "string"
p "string\r\n".chop  # => "string"
p 'string'.chop      # => "strin"
p 'strin'.chop # => "stri"
p ''.chop # => ""

str = "\r\n   Ruby on Rails   \r\n"
# 自身(self)を変更はしない
str.chop
# 変更するなら別の変数に代入する
str2 = str.chop
p str, str2
# "\r\n   Ruby on Rails   \r\n", ""\r\n   Ruby on Rails   "

# chompメソッドは文字列の末尾の改行文字を取り除いた新しい文字列を返します。
str3 = "\r\n   Ruby on Rails   \r\n"
# 自身(self)を変更はしない。
str3.chomp
# 変更するなら別の変数に代入する。
str4 = str3.chomp
p str3, str4
# "\r\n   Ruby on Rails   \r\n", "\r\n   Ruby on Rails   "

# stripメソッドは文字列の先頭と末尾の空白文字を取り除いた新しい文字列を返します。
str5 = "\r\n   Ruby on Rails   \r\n"
# 自身(self)を変更はしない。
str5.strip
# 変更するなら別の変数に代入する。
str6 = str5.strip
p str5, str6
# "\r\n   Ruby on Rails   \r\n", "Ruby on Rails"
