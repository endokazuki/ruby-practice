# frozen_string_literal: true

require 'fileutils'

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:
# https://docs.ruby-lang.org/ja/latest/method/Dir/s/delete.html
# https://docs.ruby-lang.org/ja/latest/method/FileUtils/m/rmdir.html

# プロジェクトのpath
project_path = __dir__

# 実行ファイル直下の空のディレクトリを削除
Dir.delete("#{project_path}/deletedir")
# Dir.rmdir("#{project_path}/deletedir")でも実行が可能
# FileUtils.rmdir("#{project_path}/deletedir")でも実行が可能

# 実行ファイル直下のディレクトリにファイルがある場合、削除が失敗する
Dir.delete("#{project_path}/not_deletedir")
