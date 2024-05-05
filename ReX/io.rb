# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/class/IO.html
# 書き込みメソッド
IO.write('io.md', "Ruby\nExamination\nPractice")
# 読み込みメソッド(行ごとに配列化して格納)
output = IO.readlines('io.md')
puts output.class, output
