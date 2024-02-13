require 'date'

d = Date.new(2024, 2, 15)

# フォーマット文字列	意味
# %x	日付(%m/%d/%y)
# %m	月を表す数字(01-12)
# %M	分(00-59)
# %d	日(01-31)
# %D	日付(%m/%d/%y)
# %y	西暦の下2桁(00-99)
# %Y	西暦を表す数(9999)

# %Mと%mは別物
# %Dと%xは同じ
puts d.strftime("%Y/%M/%D")
puts d.strftime("%y/%m/%d")
puts d.strftime("%x")

puts ("15/02/24" == d.strftime("%d/%m/%y") ? "OK" : "NG")
