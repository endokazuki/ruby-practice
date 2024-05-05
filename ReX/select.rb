# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Integer/i/upto.html
# https://docs.ruby-lang.org/ja/latest/method/Enumerable/i/filter.html

# Integer.upto(max):selfからmaxまで1ずつ増やすEnumerator(配列っぽいもの)として返す(self < max)
5.upto(10) { |i| p i } # => 5 6 7 8 9 10

# Enumerator.select{|item| ... } -> [object]:itemで真であるものを返す
p [1, 2, 3, 4, 5].select { |num| num.even? }
p [1, 2, 3, 4, 5].select(&:even?)
# 偶数の配列を返す

# Enumerator.find_all {|item| ... } -> [object]でも同様なことは可能
p [1, 2, 3, 4, 5].find_all(&:even?)
