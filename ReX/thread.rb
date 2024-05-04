# リファレンス: https://docs.ruby-lang.org/ja/latest/class/Thread.html
# Thread 並列処理を行うためのクラスです。Thread クラスは、Ruby のスレッドを表します。

def time1
  sleep(2)
  puts Time.now.strftime('%H時%M分%S秒')
end

def time2
  sleep(2)
  puts Time.now.strftime('%H時%M分%S秒')
end

def time3
  sleep(2)
  puts Time.now.strftime('%H時%M分%S秒')
end
# Threadを使用しない場合、処理は順番に実行される
time1
time2
time3

# Threadを利用した場合、処理は並列に実行される
# Thread.new, Thread.start, Thread.forkのいずれかでスレッドを生成。
threads = []
# Thread.new はブロックを引数として受け取り、新しいスレッドを生成します。ブロックの実行が終了すると、スレッドは終了します。
threads << Thread.new { time1 }
# Thread.start は Thread.new と同じですが、引数を指定すると、その引数をブロックの引数として渡します。
threads << Thread.start { time2 }
# Thread.fork は Thread.new と同じですが、ブロックの実行が終了してもスレッドは終了しません。
threads << Thread.fork { time3 }
# threads.each { |thr| thr.join }と同義。正確には、&で始まるブロックを引数として受け取り、シンボルである:joinをメソッドとして呼び出す。
threads.each(&:join)
