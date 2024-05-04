# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/method/Hash/i/default_proc.html

# Hash
hash_name = { 'first_name' => 'yamada', 'last_name' => 'taro' }
p hash_name['first_name']

# Symbol
symbol_name = { first_name: 'yamada', last_name: 'taro' }
p symbol_name[:first_name]

# ブロックを与えると、対応する値がまだ無いキーが呼び出される度にブロックを評価するので、全て別のオブジェクトになります。
default_hash = Hash.new { |hash, key| hash[key] = 'foo' }
p default_hash[:a] # => "foo"
p default_hash[:b] # => "foo"

# デフォルト値を設定する。この場合、keyがない場合例外処理をはく
announce_hash = Hash.new { |h, k| raise(KeyError, "Key #{k} does not exist in hash #{h}") }
# p announce_hash[:a] # => "Key a does not exist in hash {} (KeyError)"

# 回避する方法
# 1.デフォルト値を設定する(デフォルト値を設定する場合は、defaultメソッドかdefault_procメソッドを使用する)
announce_hash.default = 'default'
p announce_hash[:a] # => "default"
p announce_hash[:b] # => "default"chop_chomp_strip.rb

# 2.hashに値を格納する
announce_hash[:a] = 'value'
p announce_hash[:a] # => "value"
p announce_hash[:b] # => "default"

# 3.hashのブロックをオブジェクト化する
announce_hash = Hash.new { |h, k| raise(KeyError, "Key #{k} does not exist in hash #{h}") }
block = announce_hash.default_proc
p block # => #<Proc:0x00007f8e7b8a0f38@(irb):2>
