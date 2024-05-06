# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/any=3f.html

# Enumerable.any?:配列のboolがtrueになるまで繰り返しを行う
count = 0
10.times.any? do
  count += 1
  true if count >= 5
end
p count
