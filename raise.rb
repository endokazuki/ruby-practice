# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://jp-seemore.com/web/9618/#toc6

# 正常なエラーメッセージが発生する。正確にはStandardErrorを発生している。
raise 'Error Message'

# 配列ではなく文字列がraiseの引数として必要（exception class/object expected及びTypeErrorが発生し、raise自体のエラーが発生する）
raise ['Error Message']
