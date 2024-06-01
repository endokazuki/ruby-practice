# frozen_string_literal: true

# 回答に自信がない場合は、確認の入力を行う
check_list = {
  Q1: '',
  Q2: '',
  Q3: '',
  Q4: '',
  Q5: '',
  Q6: '',
  Q7: '',
  Q8: '',
  Q9: '',
  Q10: '',
  Q11: '',
  Q12: '',
  Q13: '',
  Q14: '',
  Q15: '',
  Q16: '',
  Q17: '確認',
  Q18: '',
  Q19: '',
  Q20: '',
  Q21: '',
  Q22: '',
  Q23: '',
  Q24: '確認',
  Q25: '確認',
  Q26: '',
  Q27: '',
  Q28: '',
  Q29: '確認',
  Q30: '',
  Q31: '確認',
  Q32: '',
  Q33: '確認',
  Q34: '',
  Q35: '',
  Q36: '',
  Q37: '確認',
  Q38: '',
  Q39: '',
  Q40: '確認',
  Q41: '確認',
  Q42: '',
  Q43: '',
  Q44: '',
  Q45: '',
  Q46: '',
  Q47: '確認',
  Q48: '',
  Q49: '',
  Q50: ''
}
# 50問の解答欄
answer_list = {
  Q1: %i[1 4],
  Q2: %i[2],
  Q3: %i[1 4],
  Q4: %i[4],
  Q5: %i[2],
  Q6: %i[4],
  Q7: %i[1],
  Q8: %i[4],
  Q9: %i[1],
  Q10: %i[1],
  Q11: %i[4],
  Q12: %i[3],
  Q13: %i[2],
  Q14: %i[3],
  Q15: %i[4],
  Q16: %i[2],
  Q17: %i[1],
  Q18: %i[2],
  Q19: %i[1],
  Q20: %i[2],
  Q21: %i[1],
  Q22: %i[3],
  Q23: %i[3],
  Q24: %i[2],
  Q25: %i[3],
  Q26: %i[3],
  Q27: %i[1 4],
  Q28: %i[1],
  Q29: %i[1 2 4],
  Q30: %i[3],
  Q31: %i[1],
  Q32: %i[1],
  Q33: %i[2],
  Q34: %i[4],
  Q35: %i[1],
  Q36: %i[4],
  Q37: %i[4],
  Q38: %i[3],
  Q39: %i[3],
  Q40: %i[4],
  Q41: %i[2],
  Q42: %i[1],
  Q43: %i[4],
  Q44: %i[2],
  Q45: %i[1],
  Q46: %i[2],
  Q47: %i[5],
  Q48: %i[4],
  Q49: %i[4],
  Q50: %i[4]
}
# 50問の解答
judge_list = {
  Q1: %i[1 4],
  Q2: %i[2],
  Q3: %i[1 4],
  Q4: %i[4],
  Q5: %i[2],
  Q6: %i[4],
  Q7: %i[1],
  Q8: %i[4],
  Q9: %i[1],
  Q10: %i[1],
  Q11: %i[4],
  Q12: %i[3],
  Q13: %i[2],
  Q14: %i[3],
  Q15: %i[4],
  Q16: %i[2],
  Q17: %i[1],
  Q18: %i[3],
  Q19: %i[1],
  Q20: %i[2],
  Q21: %i[2],
  Q22: %i[3],
  Q23: %i[3],
  Q24: %i[1],
  Q25: %i[4],
  Q26: %i[1],
  Q27: %i[1 4],
  Q28: %i[1],
  Q29: %i[1 2 4],
  Q30: %i[3],
  Q31: %i[1],
  Q32: %i[1],
  Q33: %i[3],
  Q34: %i[4],
  Q35: %i[1],
  Q36: %i[2],
  Q37: %i[3],
  Q38: %i[3],
  Q39: %i[3],
  Q40: %i[3],
  Q41: %i[2],
  Q42: %i[3],
  Q43: %i[4],
  Q44: %i[2],
  Q45: %i[1],
  Q46: %i[2],
  Q47: %i[5],
  Q48: %i[4],
  Q49: %i[4],
  Q50: %i[4],
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
