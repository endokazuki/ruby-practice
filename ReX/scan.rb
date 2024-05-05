# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/String/i/scan.html

# パターンマッチしたものを配列で返す
str = 'aaabbcccddd'
p str.scan('c')
# => ["c", "c", "c"]

# ブロックにして返すことも可能
p 'foobarbazfoobarbaz'.scan(/(ba)(.)/) { |s| p s }
# => ["ba", "r"]["ba", "z"]["ba", "r"]["ba", "z"]