# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/2.1.0/method/Kernel/m/sprintf.html
# https://docs.ruby-lang.org/ja/latest/method/String/i/sub.html
# https://docs.ruby-lang.org/ja/latest/method/String/i/gsub.html
# %の記法
# https://techracho.bpsinc.jp/hachi8833/2022_02_10/71052

# String.sub:一度だけ対象の文字を置換する
p 'apple'.sub('p', '!')
# String.gsub:対象の文字を全て置換する
p 'apple'.gsub('p', '!')

# 出力フォーマットの%
# %(String#%)の後ろに引数を指定し、%dはその渡された数値を10進数に変換する
p 'i = %d' % 10.0
# floatを渡す場合
p 'i = %f' % 10.0
# 複数指定
p '%d, %f' % [11.0, 12.0]
