head = 'Ruby'
tail = ' on Rails'
# 文字列の結合
head.concat tail
# 変数headの文字列を逆順にする(変数の変更ではない)
head.reverse
# インデックス番号1から文字列"R"の位置を返す(インデックス番号0に位置する文字列は除外される)
p head.index('R', 1)


