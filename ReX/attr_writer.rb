# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/class/NoMethodError.html
class WriterOnly
  attr_writer :write_only_variable
  attr_reader :read_only_variable

  def initialize(input)
    @read_only_variable = input
  end
end

writer_only = WriterOnly.new('value')

puts writer_only.read_only_variable

writer_only.write_only_variable = 'value2' # => オブジェクトwriter_onlyが保持するインスタンス変数write_only_variableに文字列"value"が代入される
# NameErrorではなくNoMethodErrorが発生する
# NameErrorは未定義の変数や定数を参照した場合に発生
# NoMethodErrorは未定義のメソッドを呼び出した場合に発生
# この場合、write_only_variableは読み込みメソッドが呼び出されるがattr_readerで定義されていないのでNoMethodErrorとなる
puts writer_only.write_only_variable
# => NoMethodError: undefined method `write_only_variable'
