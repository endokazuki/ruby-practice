# 50問の解答欄を作成
# 怪しい解答　Q4 Q5 Q9 Q11 Q12 Q14 Q16 Q24 Q27 Q28 Q29 Q31 Q33 Q38 Q46
answer_list = {
  Q1: [a,b],
  Q2: [a,c],
  Q3: [a,c],
  Q4: [a,d],
  Q5: [d],
  Q6: [b],
  Q7: [a],
  Q8: [d],
  Q9: [a],
  Q10: [b],
  Q11: [a],
  Q12: [b],
  Q13: [b],
  Q14: [b],
  Q15: [b],
  Q16: [a],
  Q17: [a,c],
  Q18: [d],
  Q19: [b],
  Q20: [b,e],
  Q21: [a],
  Q22: [b],
  Q23: [b],
  Q24: [d],
  Q25: [a,d],
  Q26: [b],
  Q27: [a],
  Q28: [b],
  Q29: [a,d],
  Q30: [c],
  Q31: [b],
  Q32: [d],
  Q33: [c],
  Q34: [e],
  Q35: [c],
  Q36: [c],
  Q37: [d],
  Q38: [a],
  Q39: [a,b],
  Q40: [c],
  Q41: [b],
  Q42: [c],
  Q43: [d],
  Q44: [a],
  Q45: [a],
  Q46: [e],
  Q47: [b,c],
  Q48: [b],
  Q49: [b],
  Q50: [a]
}

# 50問の解答
judge_list = = {
    Q1: [],
    Q2: [],
    Q3: [],
    Q4: [],
    Q5: [],
    Q6: [],
    Q7: [],
    Q8: [],
    Q9: [],
    Q10: [],
    Q11: [],
    Q12: [],
    Q13: [],
    Q14: [],
    Q15: [],
    Q16: [],
    Q17: [],
    Q18: [],
    Q19: [],
    Q20: [],
    Q21: [],
    Q22: [],
    Q23: [],
    Q24: [],
    Q25: [],
    Q26: [],
    Q27: [],
    Q28: [],
    Q29: [],
    Q30: [],
    Q31: [],
    Q32: [],
    Q33: [],
    Q34: [],
    Q35: [],
    Q36: [],
    Q37: [],
    Q38: [],
    Q39: [],
    Q40: [],
    Q41: [],
    Q42: [],
    Q43: [],
    Q44: [],
    Q45: [],
    Q46: [],
    Q47: [],
    Q48: [],
    Q49: [],
    Q50: []
  }

  # 50問の解答欄の正誤判定を行いさらに正解した場合正解数をカウントする
score = 0
score_result = []
answer_list.each do |key, value|
  if value == judge_list[key]
    puts "Q#{key} 正解"
    score += 1
    score_result << "Q#{key} 正解"
  else
    puts "Q#{key} 不正解"
    score_result << "Q#{key} 不正解"
  end
puts "正解数: #{score}"
end