# frozen_string_literal: true

# 50問の解答欄を作成
# 怪しい解答　Q4 Q5 Q9 Q11 Q12 Q14 Q16 Q24 Q27 Q28 Q29 Q31 Q33 Q38 Q46のチェックリスト作成
check_list = {
  Q1: '',
  Q2: '',
  Q3: '',
  Q4: '確認',
  Q5: '確認',
  Q6: '',
  Q7: '',
  Q8: '',
  Q9: '確認',
  Q10: '',
  Q11: '確認',
  Q12: '確認',
  Q13: '',
  Q14: '確認',
  Q15: '',
  Q16: '確認',
  Q17: '',
  Q18: '',
  Q19: '',
  Q20: '',
  Q21: '',
  Q22: '',
  Q23: '',
  Q24: '確認',
  Q25: '',
  Q26: '',
  Q27: '確認',
  Q28: '確認',
  Q29: '確認',
  Q30: '',
  Q31: '確認',
  Q32: '',
  Q33: '確認',
  Q34: '',
  Q35: '',
  Q36: '',
  Q37: '',
  Q38: '確認',
  Q39: '',
  Q40: '',
  Q41: '',
  Q42: '',
  Q43: '',
  Q44: '',
  Q45: '',
  Q46: '確認',
  Q47: '',
  Q48: '',
  Q49: '',
  Q50: ''
}
answer_list = {
  Q1: %w[a b],
  Q2: %w[a c],
  Q3: %w[c],
  Q4: %w[a d],
  Q5: %w[d],
  Q6: %w[b],
  Q7: %w[a],
  Q8: %w[d],
  Q9: %w[a],
  Q10: %w[b],
  Q11: %w[a],
  Q12: %w[b],
  Q13: %w[b],
  Q14: %w[b],
  Q15: %w[b],
  Q16: %w[a],
  Q17: %w[a c],
  Q18: %w[d],
  Q19: %w[b],
  Q20: %w[b e],
  Q21: %w[a],
  Q22: %w[b],
  Q23: %w[b],
  Q24: %w[d],
  Q25: %w[a d],
  Q26: %w[b],
  Q27: %w[a],
  Q28: %w[b],
  Q29: %w[a d],
  Q30: %w[c],
  Q31: %w[b],
  Q32: %w[d],
  Q33: %w[c],
  Q34: %w[e],
  Q35: %w[c],
  Q36: %w[c],
  Q37: %w[d],
  Q38: %w[a],
  Q39: %w[a b],
  Q40: %w[c],
  Q41: %w[b],
  Q42: %w[b c],
  Q43: %w[b],
  Q44: %w[a],
  Q45: %w[a],
  Q46: %w[e],
  Q47: %w[b c],
  Q48: %w[b],
  Q49: %w[b],
  Q50: %w[a]
}
# 50問の解答
judge_list = {
  Q1: %w[a b],
  Q2: %w[c e],
  Q3: %w[c],
  Q4: %w[a b],
  Q5: %w[c],
  Q6: %w[b],
  Q7: %w[a],
  Q8: %w[d],
  Q9: %w[c],
  Q10: %w[d],
  Q11: %w[c],
  Q12: %w[b],
  Q13: %w[b],
  Q14: %w[b],
  Q15: %w[b],
  Q16: %w[b],
  Q17: %w[a c],
  Q18: %w[d],
  Q19: %w[b],
  Q20: %w[b e],
  Q21: %w[c],
  Q22: %w[c],
  Q23: %w[b],
  Q24: %w[c],
  Q25: %w[a d],
  Q26: %w[b d],
  Q27: %w[a],
  Q28: %w[b],
  Q29: %w[a e],
  Q30: %w[c],
  Q31: %w[d],
  Q32: %w[b],
  Q33: %w[c],
  Q34: %w[e],
  Q35: %w[c],
  Q36: %w[c],
  Q37: %w[d],
  Q38: %w[a],
  Q39: %w[d],
  Q40: %w[c],
  Q41: %w[b],
  Q42: %w[a c],
  Q43: %w[b],
  Q44: %w[b],
  Q45: %w[a],
  Q46: %w[d e],
  Q47: %w[b c],
  Q48: %w[b],
  Q49: %w[b],
  Q50: %w[b]
}

# 50問の解答欄の正誤判定を行いさらに正解した場合正解数をカウントする
score = 0
critical_miss = 0
check_count = 0
score_result = []
total_questions = answer_list.size # 問題の総数を動的に計算

answer_list.each do |key, value|
  result = if value == judge_list[key]
             '正解'
           else
             '不正解'
           end
  score_result << "#{key} #{result}"
  score += 1 if result == '正解'

  # チェックリストの更新とカウントの管理
  if result == '不正解'
    if check_list[key].empty?
      check_list[key] = '自惚れミス'
      critical_miss += 1
    else
      check_list[key] = '復習必要'
    end
  end
  puts "#{key} #{result} #{check_list[key]}"

  check_count += 1 unless check_list[key].empty?
end

puts check_list
accuracy = score.to_f / total_questions * 100  # 正答率を計算
puts "正解数: #{score} 正答率: #{'%.2f' % accuracy}% 致命的ミス: #{critical_miss} 復習必要: #{check_count}"
