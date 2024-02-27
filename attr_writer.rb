# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/class/NoMethodError.html
class WriterOnly
  # 書き込み専用のインスタンス変数@aを定義
  attr_writer :filtered_paper

end

writer_only = WriterOnly.new
writer_only.filtered_paper = 'value' # => オブジェクトwriter_onlyが保持するインスタンス変数@aに文字列"value"が代入される
# NameErrorではなくNoMethodErrorが発生する
# 正確には、NameErrorは未定義の変数や定数を参照した場合に発生するが、NoMethodErrorは未定義のメソッドを呼び出した場合に発生する
puts writer_only.filtered_paper # => NoMethodError: undefined method `filtered_paper' for #<WriterOnly:0x00007f8f8e8d7f40>
